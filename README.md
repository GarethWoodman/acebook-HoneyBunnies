[![Build Status](https://travis-ci.org/cmb84scd/acebook-HoneyBunnies.svg?branch=master)](https://travis-ci.org/cmb84scd/acebook-HoneyBunnies)

# AceBook HoneyBunnies

### PROJECT DESCRIPTION:

For this project we worked in a team to produce a social media platform.

### REQUIRED INSTRUCTIONS:

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

- Honey Bunnies card wall is here: <https://github.com/cmb84scd/acebook-HoneyBunnies/projects/1>
- Honey Bunnies wiki is here: <https://github.com/cmb84scd/acebook-HoneyBunnies/wiki>

## Installation instructions

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate
```

## Instructions on how to run tests

```
> bundle exec rspec # Run the tests to ensure it works
```

## How to see it in operation

```
> bin/rails server # Start the server at localhost:3000
```
## Contributing to the project

Create a branch and when completed submit a pull request

## User Stories

### Completed:
```
As a User
So I can create my profile
I want to be able to sign up
```
```
As a User
So I can view my profile
I want to be able to login
```
```
As a User
So that I can keep my profile secure
I want to be able to logout
```
```
As a User - (functionality available)
So that I can express my thoughts
I want to be able to create posts
```
```
As a User
So that I can hide my embarrasment
I want to be able to delete my posts
```
```
As a User
So that I can win arguments online
I want to be able to update my posts
```
```
As a User
So that I can agree with a post
I want to be able to 'Like' it
```
```
As a User
So I can make changes to my profile
I'd like to be able to update it
```
```
As a User
So that I can start a fresh
I want to be able to delete my profile
```

### To be done:

```
As a User
So that I can show my face
I want to be able to display my profile picture
```
```
As a User
So that I can look socialiable
I want to add people as friends
```
```
As a User - (functionality available)
So that I can express my experiences
I want to be able to post photo's & links to videos (youtube etc.)
```
```
As a User
So that I can talk to a friend
I want to be able to comment on their posts
```


## Entity Relationship Diagram
### Relationships
```
User has many Posts
User has many Likes
```
```
Post has one User
Post has many Likes
```
```
Like has one User
Like has one Post
```

![ERD](https://i.ibb.co/qr3GJGh/Screenshot-2020-06-02-at-13-52-13.png)


## Workflow Diagram

![Diagram Workflow](https://github.com/cmb84scd/acebook-HoneyBunnies/blob/master/images/Untitled%20Diagram-2.png)
