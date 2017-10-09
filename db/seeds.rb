User.delete_all


User.create! [{ :username => 'bsloan', :email => 'bsloan@umich.edu', :password => 'bsloan'},
              { :username => 'david', :email => 'david@david.com', :password => 'david'},
              { :username => 'jon', :email => 'jon@jon.com', :password => 'jon'}]
