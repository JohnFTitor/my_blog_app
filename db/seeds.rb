# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..20).each do |id| 
  User.create(name: "User-#{id}",
    photo: 'https://i.pinimg.com/originals/d8/19/30/d81930b4ed6e0702d4daf02aae30b4da.png',
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut leo at diam consectetur lacinia. 
    Sed tincidunt sagittis interdum. Praesent et sollicitudin velit, nec eleifend leo. In porta quam eget libero 
    efficitur fringilla. Etiam eget ornare dolor, eget mattis sem. Nulla tempor turpis fermentum nisi faucibus 
    iaculis. Donec at sapien nunc. Sed cursus dolor at lobortis gravida. Curabitur in mollis mi. Proin purus sem, 
    placerat at lacus sed, facilisis molestie sapien. Fusce at ultricies mauris, id dapibus risus. Aliquam erat volutpat.",
    posts_counter: 0)
end

(1..100).each do |id|
  Post.create(author: User.find(rand(1..20)), title: "Post ##{id}", 
  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut leo at diam consectetur lacinia. 
  Sed tincidunt sagittis interdum. Praesent et sollicitudin velit, nec eleifend leo. In porta quam eget libero 
  efficitur fringilla. Etiam eget ornare dolor, eget mattis sem. Nulla tempor turpis fermentum nisi faucibus 
  iaculis. Donec at sapien nunc. Sed cursus dolor at lobortis gravida. Curabitur in mollis mi. Proin purus sem, 
  placerat at lacus sed, facilisis molestie sapien. Fusce at ultricies mauris, id dapibus risus. Aliquam erat volutpat\n
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut leo at diam consectetur lacinia. 
  Sed tincidunt sagittis interdum. Praesent et sollicitudin velit, nec eleifend leo. In porta quam eget libero 
  efficitur fringilla. Etiam eget ornare dolor, eget mattis sem. Nulla tempor turpis fermentum nisi faucibus 
  iaculis. Donec at sapien nunc. Sed cursus dolor at lobortis gravida. Curabitur in mollis mi. Proin purus sem, 
  placerat at lacus sed, facilisis molestie sapien. Fusce at ultricies mauris, id dapibus risus. Aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut leo at diam consectetur lacinia. 
  Sed tincidunt sagittis interdum. Praesent et sollicitudin velit, nec eleifend leo. In porta quam eget libero 
  efficitur fringilla. Etiam eget ornare dolor, eget mattis sem. Nulla tempor turpis fermentum nisi faucibus 
  iaculis. Donec at sapien nunc. Sed cursus dolor at lobortis gravida. Curabitur in mollis mi. Proin purus sem, 
  placerat at lacus sed, facilisis molestie sapien. Fusce at ultricies mauris, id dapibus risus. Aliquam erat volutpat.\n
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut leo at diam consectetur lacinia. 
  Sed tincidunt sagittis interdum. Praesent et sollicitudin velit, nec eleifend leo. In porta quam eget libero 
  efficitur fringilla. Etiam eget ornare dolor, eget mattis sem. Nulla tempor turpis fermentum nisi faucibus 
  iaculis. Donec at sapien nunc. Sed cursus dolor at lobortis gravida. Curabitur in mollis mi. Proin purus sem, 
  placerat at lacus sed, facilisis molestie sapien. Fusce at ultricies mauris, id dapibus risus. Aliquam erat volutpat.",
  comments_counter: 0,
  likes_counter: 0)
end
  
(1..200).each do |id|
  Comment.create(post: Post.find(rand(1..100)), author: User.find(rand(1..20)), text: "This is comment ##{id}")
end

(1..200).each do 
  Like.create(post: Post.find(rand(1..100)), author: User.find(rand(1..20)))
end
