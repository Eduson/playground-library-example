
# Общие моменты

За основу было взято itresume. Если есть желание добавить еще элементы, то это обсуждаемо.

Задание представляется как **набор файлов**. GitHub нам не обязателен, но имхо, дает много преимуществ:

* Github  автоматом рендерит  Markdown файлы, так что редактировать можно прямо в нем.
* Есть обязательные файлы. Но никто не запрещает добавлять дополнительные, как этот файл. Можно вести историю, делать списки уроков, todo  листы по урокам.
* Видна история изменений.
* Удобно использовать механизм Pull Request для правок нескольких файлов / уроков

Но если github не зайдет, теоретически, можем и без него.

В админке eduson.tv мы делаем новый тип урока “Домашние задание SQL” В настройках урока указывается только номер упражнения. Все остальное, по номеру, берется из файлов.

Для нужд тестирования, поднимим вам отдельное рабочие окружение, где сможете проверять упражнение, перед тем как выкатить их на прод.

Нюансы работы с Git / GitHub - расскажу покажу.

# Упражнение

Вот [пример одного задания](./exercises/901_test_exercise/)

Задание состоит из элементов:
* Заголовок
* Текстовое описание
* Несколько подсказок
* Решение в виде SQL
* Текстовое пояснение к решению

## Структура файлов упражнения

Каждое упражнение это каталог в [exercises](./exercises/)

Имя каталога должно начинать с трех цифр. Используем ведущие нули. Номер должен быть уникальным. После цифр может быть произвольное название - просто для вашего удобства

Хорошо:
* exercises/001_test_exercise/
* exercises/002 текст на русском/
* exercises/023_текст_без_пробелов/
* exercises/423-еще-название/

Но рекомендую соблюдать какой то единый стиль.

Плохо:
* exercises/1_test_exercise/  - 1 цифра а не 3
* exercises/01_test_exercise/  - 2 цифры а не 3
* exercises/test_exercise_123/  - цифры не в начале
* exercises/024/    - формально правильно, но, имхо, с текстовым описание удобней

Номер должен быть **уникальным**. Так нельзя, потому что 23 повторяется
* exercises/023_test_exercise/  
* exercises/023_new_exercise/

## Содержимое каталога упражнения

### Метаданные

[metadata.yaml](./exercises/901_test_exercise/metadata.yaml)  YAML  файл в котором содераться все атрибуты урока. Сейчас обязательный только  title.  Но, возможно, будут полезны и другие
* Если мы будем использовать несколько БД, то указываем к какой БД делаем запросы
* Сложность задания
* Тэги
* Требуемая версия  PostgreSQL
* Автор / ответственный / куратора упражнения
* Список таблиц, чтобы их описание подтягивалось автоматом
* и тд

### Текст упражнения 

[exercise.md](./exercises/901_test_exercise/exercise.md)  Сам текст задания в Markdown.

###  Подсказки

Каталог [hints](./exercises/901_test_exercise/hints/). Каждый файл в нем это подсказка.  
Имя файла должно начинать с двух цифр. Используем ведущие нули.  Номер должен быть уникальным.  После цифр может быть произвольное название - просто для вашего удобства

### Решение

[solution.sql](./exercises/901_test_exercise/solution.sql) обязательный файл.  Эталонное решение в виде SQL запроса. Оно **не отображается** юзеру.
Используется **только** для проверки решению. Этот запрос выполняется и полученная выборка сравнивается,с выборкой от запроса студента. Упражнение считается решенным, если выборки в точности совпадают.

[solution.md](./exercises/901_test_exercise/solution.md) Текстовое пояснение решения. Только этот текст видет студент как решение.

То есть если SQL запрос нужно дублировать в `solution.sql` и `solution.md`


# Вопросы на обсуждение

1. Нужно обсудить на каких тестовых данных будут выполняться запросы. Есть ли у нас готовый SQL со структурой и данными? или нужно будет искать / делать?
2. В itresume в каждом задание есть структура таблиц. Возможно будет проще вынести их в отдельные файлы и для каждого задания указывать в метаданных список таблиц. Их текстовое описание будет подтягиваться автоматически. Если да, то скажите, сразу внесу в формат
3. После запуска первой  MVP  версии, нужно будет решить удобен ли подход с файлами или надо сделать админку для редактирования уроков.
4. Было бы хорошо вам сделать 2-3 тестовых задания, чтобы и у нас были тестовые данные и вы бы, на практике, поняли, все ли ок и устраивает ли структура.
