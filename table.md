# Giải thích Chi tiết Các Liên kết trong Cơ sở Dữ liệu

## Bảng `users`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi người dùng.
- **username** (Unique): Tên đăng nhập của người dùng.
- **password**: Mật khẩu của người dùng.
- **email**: Địa chỉ email của người dùng.
- **full_name**: Tên đầy đủ của người dùng.
- **bio**: Thông tin ngắn về người dùng.
- **profile_pic**: Đường dẫn đến ảnh đại diện của người dùng.
- **created_at**: Thời gian tạo tài khoản.

## Bảng `groups`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi nhóm.
- **name**: Tên của nhóm.
- **description**: Mô tả về nhóm.
- **created_by** (Foreign Key to `users.id`): Mã định danh của người tạo nhóm.

## Bảng `group_members`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi thành viên nhóm.
- **group_id** (Foreign Key to `groups.id`): Mã định danh của nhóm.
- **user_id** (Foreign Key to `users.id`): Mã định danh của người dùng.
- **is_admin**: Xác định xem người dùng có phải là quản trị viên của nhóm không.
- **joined_at**: Thời gian người dùng tham gia nhóm.

## Bảng `group_invitations`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi lời mời.
- **group_id** (Foreign Key to `groups.id`): Mã định danh của nhóm mời.
- **invited_user_id** (Foreign Key to `users.id`): Mã định danh của người được mời.
- **invited_by** (Foreign Key to `users.id`): Mã định danh của người gửi lời mời.
- **status**: Trạng thái của lời mời (Pending, Accepted, Rejected).
- **invited_at**: Thời gian gửi lời mời.
- **responded_at**: Thời gian phản hồi lời mời.

## Bảng `group_blogs`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi bài viết.
- **group_id** (Foreign Key to `groups.id`): Mã định danh của nhóm chứa bài viết.
- **author_id** (Foreign Key to `users.id`): Mã định danh của người viết bài.
- **title**: Tiêu đề của bài viết.
- **content**: Nội dung của bài viết.
- **created_at**: Thời gian tạo bài viết.
- **updated_at**: Thời gian cập nhật bài viết lần cuối.

## Bảng `personal_blogs`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi bài viết cá nhân.
- **author_id** (Foreign Key to `users.id`): Mã định danh của người viết bài.
- **title**: Tiêu đề của bài viết.
- **content**: Nội dung của bài viết.
- **is_public**: Xác định bài viết có công khai hay không.
- **created_at**: Thời gian tạo bài viết.
- **updated_at**: Thời gian cập nhật bài viết lần cuối.

## Bảng `notifications`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi thông báo.
- **user_id** (Foreign Key to `users.id`): Mã định danh của người nhận thông báo.
- **message**: Nội dung thông báo.
- **is_read**: Xác định xem thông báo đã được đọc hay chưa.
- **created_at**: Thời gian tạo thông báo.

## Bảng `roles`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi vai trò.
- **name**: Tên của vai trò (vd: admin, member,...).
- **description**: Mô tả về vai trò.

## Bảng `group_roles`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi vai trò nhóm.
- **group_id** (Foreign Key to `groups.id`): Mã định danh của nhóm.
- **user_id** (Foreign Key to `users.id`): Mã định danh của người dùng.
- **role_id** (Foreign Key to `roles.id`): Mã định danh của vai trò.

## Bảng `comments`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi bình luận.
- **blog_id** (Foreign Key to `group_blogs.id` hoặc `personal_blogs.id`): Mã định danh của bài viết mà bình luận liên quan đến.
- **author_id** (Foreign Key to `users.id`): Mã định danh của người viết bình luận.
- **content**: Nội dung bình luận.
- **created_at**: Thời gian tạo bình luận.
- **updated_at**: Thời gian cập nhật bình luận lần cuối.

## Bảng `files`
- **id** (Primary Key): Mã định danh duy nhất cho mỗi tệp.
- **blog_id** (Foreign Key to `group_blogs.id` hoặc `personal_blogs.id`): Mã định danh của bài viết mà tệp liên quan đến.
- **file_path**: Đường dẫn đến tệp được lưu trữ.
- **file_name**: Tên của tệp.
- **uploaded_at**: Thời gian tệp được tải lên.

## Các Liên Kết 

- **`groups.created_by` > `users.id`**: Xác định người dùng nào đã tạo ra nhóm.
- **`group_members.group_id` > `groups.id`**: Xác định nhóm mà thành viên thuộc về.
- **`group_members.user_id` > `users.id`**: Xác định người dùng nào là thành viên của nhóm.
- **`group_invitations.group_id` > `groups.id`**: Xác định nhóm mà lời mời thuộc về.
- **`group_invitations.invited_user_id` > `users.id`**: Xác định người dùng được mời.
- **`group_invitations.invited_by` > `users.id`**: Xác định người dùng gửi lời mời.
- **`group_blogs.group_id` > `groups.id`**: Xác định nhóm chứa bài viết.
- **`group_blogs.author_id` > `users.id`**: Xác định người viết bài viết.
- **`personal_blogs.author_id` > `users.id`**: Xác định người viết bài viết cá nhân.
- **`notifications.user_id` > `users.id`**: Xác định người nhận thông báo.
- **`group_roles.group_id` > `groups.id`**: Xác định nhóm mà vai trò thuộc về.
- **`group_roles.user_id` > `users.id`**: Xác định người dùng có vai trò trong nhóm.
- **`group_roles.role_id` > `roles.id`**: Xác định vai trò cụ thể trong nhóm.
- **`comments.blog_id` > `group_blogs.id` hoặc `personal_blogs.id`**: Xác định bài viết mà bình luận liên quan đến.
- **`comments.author_id` > `users.id`**: Xác định người viết bình luận.
- **`files.blog_id` > `group_blogs.id` hoặc `personal_blogs.id`**: Xác định bài viết mà tệp liên quan đến.
