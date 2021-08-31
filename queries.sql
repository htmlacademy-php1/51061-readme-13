#Напишите запросы для добавления информации в БД:
USE readme;
#-придумайте пару комментариев к разным постам;
INSERT INTO comments (content, author_id, post_id)
VALUES ("Комментарий1", 1, 5),
       ("Комментарий2", 1, 5);

#-существующий список постов.
INSERT INTO posts (title, content_type_id, author_id, url, image_url, TEXT)
VALUES ('Тест', 1, 2, null, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),
       ('Игра престолов', 2, 2, null, NULL, 'Не могу дождаться начала финального сезона своего любимого сериала!'),
       ('Лучшие курсы', 5, 1, 'www.htmlacademy.ru', NULL, null),
       ('Наконец, обработал фотки!', 3, 2, null, 'rock-medium.jpg', null),
       ('Моя мечта', 3, 2, null, 'coast-medium.jpg', NULL);

#-придумайте пару пользователей;
INSERT INTO users (email, login, password)
VALUES ("first@mail.ru", "first", "first123"),
       ("second@mail.ru", "second", "second123");
#-список типов контента для поста;
INSERT INTO types (title, icon_class)
VALUES ("Текст", "text"),
       ("Цитата", "quote"),
       ("Картинка", "photo"),
       ("Видео", "video"),
       ("Ссылка", "link");

#Напишите запросы для этих действий:
#получить список постов с сортировкой по популярности и вместе с именами авторов и типом контента;
USE readme;
SELECT login, icon_class, content_type_id, p.title, views
FROM posts p
       INNER JOIN users u ON p.author_id = u.id
       LEFT JOIN types t ON p.content_type_id = t.id
ORDER BY views DESC;
#получить список постов для конкретного пользователя;
USE readme;
SELECT *
FROM posts p
       INNER JOIN users u ON p.author_id = 1;
#получить список комментариев для одного поста, в комментариях должен быть логин пользователя;
USE readme;
SELECT content, u.login
FROM comments c
       JOIN users u ON c.author_id = u.id
WHERE post_id = 6;
#добавить лайк к посту;
#подписаться на пользователя.
