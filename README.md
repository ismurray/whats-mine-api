# WhatsMine: A shared inventory tracker
This is a back-end API for the WhatsMine client, which is a site where users can keep track of the things they care about, organized into shareable boxes. Users
can add and remove each other from boxes, with variable levels of resource
control (read-only, admin). Users can also send SMS reminder messages to each
other about items in their shared boxes.


- [Deployed API](https://whats-mine-api.herokuapp.com/)

## WhatsMine Client
- [Live Site](https://ismurray.github.io/whats-mine-client/)
- [GitHub Repo](https://github.com/ismurray/whats-mine-client)


## API End Points

| Verb   | URI Pattern                 | Controller#Action         |
|--------|-----------------------------|---------------------------|
| POST   | `/sign-up`                  | `users#signup`            |
| POST   | `/sign-in`                  | `users#signin`            |
| DELETE | `/sign-out`                 | `users#signout`           |
| PATCH  | `/change-password`          | `users#changepw`          |
| PATCH  | `/users/:id`                | `users#update`            |
| POST   | `/twilio/text`              | `twilio#text`             |
| GET    | `/boxes`                    | `boxes#index`             |
| POST   | `/boxes`                    | `boxes#create`            |
| GET    | `/boxes/:id`                | `boxes#show`              |
| PATCH  | `/boxes/:id`                | `boxes#update`            |
| DELETE | `/boxes/:id`                | `boxes#destroy`           |
| GET    | `/items`                    | `items#index`             |
| POST   | `/items`                    | `items#create`            |
| GET    | `/items/:id`                | `items#show`              |
| PATCH  | `/items/:id`                | `items#update`            |
| DELETE | `/items/:id`                | `items#destroy`           |
| GET    | `/users_boxes`              | `users_boxes#index`       |
| POST   | `/users_boxes`              | `users_boxes#create`      |
| GET    | `/users_boxes/:id`          | `users_boxes#show`        |
| PATCH  | `/users_boxes/:id`          | `users_boxes#update`      |
| DELETE | `/users_boxes/:id`          | `users_boxes#destroy`     |


All data returned from API actions is formatted as JSON.

### Current ERD:
![alt text](https://i.imgur.com/UdPj2W2.jpg "Current ERD")

## Planning and Development:

## Minimum Viable Product ERD:
![alt text](https://i.imgur.com/cYaV3cy.jpg "MVP ERD")

## Stretch Goal ERD:
![alt text](https://i.imgur.com/4KdVl37.jpg "Stretch ERD")

## Technologies Used
* Ruby on Rails
* PostgresQL
* Heroku
* Git/Github
* Atom
* Twilio

## Installation
1. Fork and clone this repository
2. Install dependencies with `bundle install`

## Future Iterations
- Sorted categories for Boxes, so you can see which ones are private, which ones
you share, and which ones you only have read-access to
- Item descriptions
- Item access control that is separate from Box access control

## Disclaimer
This API may be reset or altered at anytime.  The future of this API may not align with the current state and therefore the state your client application expects.  If you would like to maintain a version of this API in its current state for your future use, please fork and clone the repository and launch it on heroku.
