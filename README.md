
![](https://img.shields.io/static/v1?label=BY&message=JohnFTitor&color=blue)
![](https://img.shields.io/badge/Microverse-blueviolet)

## My Blog App

> This is a basic Blog website that allows users to create, edit, comment and delete posts, keeping data in a database. This project implements both authorization and authentication in order to provide extended functionality to logged in and authorized users.    

### Requirements
In order to work on this project, you need to have the following dependencies installed: 

- [Ruby](https://www.ruby-lang.org/en/) 
- [Postgresql](https://www.postgresql.org/)
- [Node.js](https://nodejs.org/en/)
- [Yarn](https://yarnpkg.com/)
- [Rails](https://rubyonrails.org/)

## Built With

- Languages: _**Ruby**_
- Frameworks: _**Ruby On Rails**_
- Technologies used: _**Visual Studio Code**_

## Getting Started

### Clone this repository

```bash
$ git clone git@github.com:JohnFTitor/my_blog_app.git
$ cd my_blog_app
```

### Commands to run

Run 
```bash
$ bundle install 
```

To get all the gems required for the project

Then, run

```bash
$ npm install 
```
To install packages such as style linters

To check linters locally, use
```bash
$ rubocop
$ npx stylelint "**/*.{css,scss}"
```

Once you have the project correctly set up, run 
```bash
$ bin/rails db:setup
```

To run all migrations, create the database for testing and for development, and insert some data into the database for you to visualize the changes

Finally, each time you make changes to the project, run 

```bash
$ bundle exec rspec /spec
```

In the root folder to check the consistency of the app. Please don't make changes to the tests unless completely necessary, and mention it in your PR description. 

Important note: Since this project uses TailwindCSS for the styling, you need to run: 

```bash
$ ./bin/dev
```

For you to see the styling being applied in the browser during development

## Authors

:bust_in_silhouette: **Andrés Felipe Arroyave Naranjo**

 Platform | Badge |
 --- | --- |
 **GitHub**    | [@JohnFTitor](https://github.com/JohnFTitor)
 **Twitter**   | [@johnftitor](https://twitter.com/johnftitor)
 **LinkedIn**  | [Andres](https://www.linkedin.com/in/andresarroyavenaranjo/?locale=en_US)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!
