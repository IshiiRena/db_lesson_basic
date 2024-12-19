Q1
CREATE TABLE departments (
  department_id INT unsigned NOT NULL auto_increment PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
ALTER TABLE people ADD COLUMN department_id INT unsigned NULL AFTER email;

Q3
INSERT INTO departments (name) VALUES ('営業'),('開発'),('経理'),('人事'),('情報システム');

INSERT INTO people (name, email, age, gender,department_id)
    VALUES
    ('菊池風磨', 'kikuchi@gizumo.jp', 29, 1,1),
    ('佐藤勝利', 'satou@gizumo.jp', 28, 1,2),
    ('松島聡', 'matsushima@gizumo.jp', 27, 1,1),
    ('マリウス葉', 'mariusu@gizumo.co.jp', 24, 1,2),
    ('中島健人', 'nakajima@gizumo.co.jp', 30, 1,1),
    ('桜井はな','sakurai@gizumo.co.jp',26,2,2),
    ('川島美央','kawashima@gizumo.co.jp',31,2,2),
    ('新島桃','nijima@gizumo.co.jp',25,2,3),
    ('二宮さき','ninomiya@gizumo.co.jp',32,2,4),
    ('佐々木ゆあ','sasaki@gizumo.co.jp',23,2,5);

    INSERT INTO reports (person_id, content) VALUES 
    (7,'今日は猫日和でしたね'),(9,'私は柴犬と戯れました'),
    (8,'思いのほか忙しかったです'),(10,'いつもより頑張りました'),
    (12,'お腹がすいたので帰ります'),(9,'ミスなく終えられてよかったです'),
    (11,'雨が降っていて気持ちが沈みました'),(12,'明日は晴れるといいですね'),
    (13,'元気に一日を過ごせました'),(8,'寒かったので暖かいものを飲みます');

Q4
    UPDATE people SET department_id = '1' WHERE person_id = 1;
    UPDATE people SET department_id = '2' WHERE person_id = 2;
    UPDATE people SET department_id = '1' WHERE person_id = 3;
    UPDATE people SET department_id = '2' WHERE person_id = 4;

Q5
  SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;
    

Q6
  作成日時の昇順で人々という名前のテーブルの部署IDというカラムが1の人の
  名前、メールアドレス、年齢のレコードを取得するということ。

Q7
  SELECT name FROM people 
  WHERE gender = 1 AND age BETWEEN 40 AND 49 OR gender = 2 AND age BETWEEN 20 AND 29;

Q8
 SELECT name,age FROM people WHERE department_id = 1 ORDER BY age;

Q9
 SELECT AVG(age) AS average_age FROM people WHERE gender = 2 AND department_id = 2;

Q10
 SELECT p.name, d.name AS department_name, r.content AS reports_content FROM people p 
 JOIN departments d ON p.department_id = d.department_id JOIN reports r ON p.person_id = r.person_id;

Q11
SELECT p.name, r.content FROM people p LEFT OUTER JOIN reports r ON p.person_id = r.person_id where content IS NULL;
