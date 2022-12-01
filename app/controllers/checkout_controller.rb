class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    puts "-" * 60
    #---------------------------
    @cartlist = Cart.where(user: current_user)    

    a = 0
    
    b = ""

    @cartlist.each do |i|
      a = a + i.product.price
      b = b + "<p> - #{i.product.title}    #{i.product.price} €</p>"
      ok = Order.create(user: current_user, title: i.product.title, price: i.product.price, stock: i.product.stock, description: i.product.description)
      i.destroy
    end

    variable = Mailjet::Send.create(messages: [{
      'From'=> {
        'Email'=> 'dylanjh34@gmail.com',
        'Name'=> 'dylan'
      },
      'To'=> [
        {
          'Email'=> "#{current_user.email}",
          'Name'=> 'dylan'
        }
      ],
      'Subject'=> 'Greetings from Mailjet.',
      'TextPart'=> 'My first Mailjet email',
      'HTMLPart'=> " 
      <h1>Bonjour #{current_user.first_name}</h1>
      <h2> Validation de votre Commande Pour un Total de #{a} €</h2>
      <h3>Voici la Liste de vos achats</h3>
      <p>#{b}</p>
      ",
      'CustomID' => 'AppGettingStartedTest'
    }]
    )
    p variable.attributes['Messages']
    
    #---------------------------

    #---------------------------

     variablee = Mailjet::Send.create(messages: [{
       'From'=> {
         'Email'=> 'dylanjh34@gmail.com',
         'Name'=> 'dylan'
       },
       'To'=> [
         {
           'Email'=> "dylanjh34@gmail.com",
           'Name'=> 'dylan'
         }
       ],
       'Subject'=> 'Greetings from Mailjet.',
       'TextPart'=> 'My first Mailjet email',
       'HTMLPart'=> " 
       <h1>#{current_user.first_name} Viends de passer une commande</h1>
       <h2> Total de #{a} €</h2>
       <h3>Voici la Liste des achats</h3>
       <p>#{b}</p>
       ",
       'CustomID' => 'AppGettingStartedTest'
     }]
     )
     p variablee.attributes['Messages']
     
     #---------------------------

    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end