# Cryptracker 

## Ruby on Rails 

###### The Problem 

Me and my partner are both inclined in crypto, sometimes when we want to view our cryptocurrencies, we would go to each wallet and it would take long, considering looking at the prices, as well as computing how much we win or lost, it just takes so much time. So we thought that what if there was an app that could store all of our cryptocurrencies, and compute the profit or loss? That would be perfect! That's why Cryptracker was born. Cryptracker is an app that we built so that traders would not struggle to look into each wallet to monitor their cryptocurrencies, in a single app they could monitor and track their cryptocurrencies. 

## Try it in your local machine! 

```zsh
git clone https://github.com/exceljake/cryptotracker.git
```

```zsh
cd cryptotracker
```

```zsh
bundle install
```

```zsh
rails db:create
```

```zsh
rails db:migrate
```

```zsh
rails server -p 4000
```

## Routes 

###### User

```zsh
POST /auth

# Sign up route 
# Will create a new user 

```

```zsh
POST /auth/sign_in

# Sign in route 
# Will sign in user, and post a new_user_session

```

###### Wallets

```zsh
GET /wallets

# Index of wallets route 
# Will display all of user's wallets

```

```zsh
POST /wallets

# Create wallet route 
# Will create a new wallet, posting it to index

```

```zsh
DELETE 	/wallets/:id

# Delete wallet route 
# Will delete a wallet, removing it from index

```

###### CRYPTOCURRENCIES

```zsh
GET /wallets/:wallet_id/cryptocurrencies

# Index of cryptocurrencies route 
# Will display all of the wallet's cryptocurrencies

```

```zsh
POST /wallets/:wallet_id/cryptocurrencies

# Create cryptocurrency route 
# Will create a new cryptocurrency, posting it to index

```

```zsh
DELETE /wallets/:wallet_id/cryptocurrencies

# Delete cryptocurrency route 
# Will delete a cryptocurrency, removing it from index

```

```zsh
GET /all

# All cryptocurrency route 
# Will display all cryptocurrencies of user regardless of wallet

```

## Try it on Postman! 

- Sign up first! 
- Needed headers: access-token, client, expiry, uid
- Enjoy! Have fun creating wallets and cryptocurrencies! 

## Technologies

* Ruby 3.1.0 
* Ruby on Rails 7.0.3.1 
* Postgresql 
* `Rest-client` gem 
* `devise_token_auth` gem 


