DEFAULT_USERS   = [
  {
    :first_name => 'Rich',
    :last_name  => 'Wells',
    :email      => 'rich@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'David',
    :last_name  => 'Thompson',
    :email      => 'david@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Matt',
    :last_name  => 'Atkins',
    :email      => 'matt@yoomee.com',
    :role       => 'admin'    
  },
  {
    :first_name => 'Andy',
    :last_name  => 'Mayer',
    :email      => 'andy@yoomee.com',
    :role       => 'admin'    
  },
  {
    :first_name => 'Nicola',
    :last_name  => 'Mayer',
    :email      => 'nicola@yoomee.com',
    :role       => 'admin'    
  },
  {
    :first_name => 'Edward',
    :last_name  => 'Andrews-Hodgson',
    :email      => 'edward@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Jon',
    :last_name  => 'Kyte',
    :email      => 'jon@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Tim',
    :last_name  => 'Brazier',
    :email      => 'tim@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Carrie',
    :last_name  => 'Jackson',
    :email      => 'carrie@yoomee.com',
    :role       => 'admin'
  },
  {
    :first_name => 'Greg',
    :last_name  => 'Woodcock',
    :email      => 'greg@yoomee.com',
    :role       => 'admin'
  }
]

DEFAULT_USERS.each do |user_attrs|
  user = User.new(user_attrs)
  user.encrypted_password = "$2a$10$0I7i6.g2JMYLoLzYpAZPcujZpGhQ/oJ41RaaMm.8Ff.1k9thCALIm"
  user.save(:validate => false)
end
