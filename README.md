# Dự Án Quản Lý Nhóm và Blog

## Tổng Quan

Dự án quản lý nhóm và blog cung cấp một nền tảng để quản lý người dùng, nhóm, bài viết nhóm và cá nhân, cùng với các thông báo và tệp đính kèm. Hệ thống cho phép người dùng tạo và tham gia các nhóm, viết và quản lý các bài viết, mời người khác tham gia nhóm và nhận thông báo.

## Cấu Trúc Cơ Sở Dữ Liệu

### Các Bảng

- **Bảng `users`**
  - `id` (Primary Key)
  - `username` (Unique)
  - `password`
  - `email`
  - `full_name`
  - `bio`
  - `profile_pic`
  - `created_at`

- **Bảng `groups`**
  - `id` (Primary Key)
  - `name`
  - `description`
  - `created_by` (Foreign Key to `users.id`)
  - `created_at`

- **Bảng `group_members`**
  - `id` (Primary Key)
  - `group_id` (Foreign Key to `groups.id`)
  - `user_id` (Foreign Key to `users.id`)
  - `is_admin` (Boolean)
  - `joined_at`

- **Bảng `group_invitations`**
  - `id` (Primary Key)
  - `group_id` (Foreign Key to `groups.id`)
  - `invited_user_id` (Foreign Key to `users.id`)
  - `invited_by` (Foreign Key to `users.id`)
  - `status` (Pending/Accepted/Rejected)
  - `invited_at`
  - `responded_at`

- **Bảng `group_blogs`**
  - `id` (Primary Key)
  - `group_id` (Foreign Key to `groups.id`)
  - `author_id` (Foreign Key to `users.id`)
  - `title`
  - `content`
  - `created_at`
  - `updated_at`

- **Bảng `personal_blogs`**
  - `id` (Primary Key)
  - `author_id` (Foreign Key to `users.id`)
  - `title`
  - `content`
  - `is_public` (Boolean)
  - `created_at`
  - `updated_at`

- **Bảng `notifications`**
  - `id` (Primary Key)
  - `user_id` (Foreign Key to `users.id`)
  - `message`
  - `is_read` (Boolean)
  - `created_at`

- **Bảng `roles`**
  - `id` (Primary Key)
  - `name` (admin, member, ...)
  - `description`

- **Bảng `group_roles`**
  - `id` (Primary Key)
  - `group_id` (Foreign Key to `groups.id`)
  - `user_id` (Foreign Key to `users.id`)
  - `role_id` (Foreign Key to `roles.id`)

- **Bảng `comments`**
  - `id` (Primary Key)
  - `blog_id` (Foreign Key to `group_blogs.id` or `personal_blogs.id`)
  - `author_id` (Foreign Key to `users.id`)
  - `content`
  - `created_at`
  - `updated_at`

- **Bảng `files`**
  - `id` (Primary Key)
  - `blog_id` (Foreign Key to `group_blogs.id` or `personal_blogs.id`)
  - `file_path`
  - `file_name`
  - `uploaded_at`

## Quy Trình Hoạt Động

1. **Người dùng đăng ký và đăng nhập** vào hệ thống.
2. **Người dùng tạo và quản lý nhóm**, tham gia nhóm, và mời người khác tham gia.
3. **Người dùng viết và quản lý các bài viết** trong nhóm hoặc cá nhân.
4. **Người dùng bình luận và tải lên tệp** đính kèm cho các bài viết.
5. **Người dùng nhận thông báo** về các sự kiện quan trọng liên quan đến họ.
6. **Quản lý vai trò** trong các nhóm để xác định quyền hạn của người dùng.

-.
[dbdiagram](https://dbdiagram.io/d/66b496e68b4bb5230e931c71)
