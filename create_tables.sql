//// Docs: https://dbml.dbdiagram.io/docs
//// -- LEVEL 1
//// -- Schemas, Tables and References

// Creating tables
Table users {
  id int [pk, increment] // auto-increment
  username varchar(50) [not null, unique]
  password varchar(255) [not null]
  email varchar(100)
  full_name varchar(100)
  bio text
  profile_pic varchar(255)
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table groups {
  id int [pk, increment] // auto-increment
  name varchar(100) [not null]
  description text
  created_by int [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table group_members {
  id int [pk, increment] // auto-increment
  group_id int [not null]
  user_id int [not null]
  is_admin boolean [default: `FALSE`]
  joined_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table group_invitations {
  id int [pk, increment] // auto-increment
  group_id int [not null]
  invited_user_id int [not null]
  invited_by int [not null]
  status enum('Pending', 'Accepted', 'Rejected') [default: `Pending`]
  invited_at timestamp [default: `CURRENT_TIMESTAMP`]
  responded_at timestamp
}

Table group_blogs {
  id int [pk, increment] // auto-increment
  group_id int [not null]
  author_id int [not null]
  title varchar(255) [not null]
  content text [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
  updated_at timestamp
}

Table personal_blogs {
  id int [pk, increment] // auto-increment
  author_id int [not null]
  title varchar(255) [not null]
  content text [not null]
  is_public boolean [default: `TRUE`]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
  updated_at timestamp
}

Table notifications {
  id int [pk, increment] // auto-increment
  user_id int [not null]
  message text [not null]
  is_read boolean [default: `FALSE`]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table roles {
  id int [pk, increment] // auto-increment
  name enum('admin', 'member') [not null]
  description text
}

Table group_roles {
  id int [pk, increment] // auto-increment
  group_id int [not null]
  user_id int [not null]
  role_id int [not null]
}

Table comments {
  id int [pk, increment] // auto-increment
  blog_id int [not null]
  author_id int [not null]
  content text [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
  updated_at timestamp
}

Table files {
  id int [pk, increment] // auto-increment
  blog_id int [not null]
  file_path varchar(255) [not null]
  file_name varchar(255) [not null]
  uploaded_at timestamp [default: `CURRENT_TIMESTAMP`]
}

// Creating references
Ref: groups.created_by > users.id
Ref: group_members.group_id > groups.id
Ref: group_members.user_id > users.id
Ref: group_invitations.group_id > groups.id
Ref: group_invitations.invited_user_id > users.id
Ref: group_invitations.invited_by > users.id
Ref: group_blogs.group_id > groups.id
Ref: group_blogs.author_id > users.id
Ref: personal_blogs.author_id > users.id
Ref: notifications.user_id > users.id
Ref: group_roles.group_id > groups.id
Ref: group_roles.user_id > users.id
Ref: group_roles.role_id > roles.id
Ref: comments.blog_id > group_blogs.id
Ref: comments.blog_id > personal_blogs.id
Ref: comments.author_id > users.id
Ref: files.blog_id > group_blogs.id
Ref: files.blog_id > personal_blogs.id
