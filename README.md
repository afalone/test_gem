# TestGem


## Task

Напишите скрипт nmax, который делает следующее:
* читает из входящего потока текстовые данные;
* по завершении ввода выводит n самых больших целых чисел, встретившихся в
полученных текстовых данных.
Дополнительные указания:
* числом считается любая непрерывная последовательность цифр в тексте;
* известно, что чисел длиннее 1000 цифр во входных данных нет;
* число n должно быть единственным параметром скрипта;
* код должен быть покрыт тестами;
* код должен быть оформлен в виде гема (содержащего исполняемый файл, код
модулей и т.д.);
* плюсом является размещение на Github и интеграция с Travis CI.

Пример запуска:
cat sample_data_40GB.txt | nmax 10000

Дополнительные допущения по условию задачи. Числа нужно только распечатать. Обрабатывать не надо. Памяти для
хранения всего файла или всех чисел из файла может не хватить -- 40GB.txt. Надо делать стримовый парсер. Размер
буфера стрима достаточно выбрать 2 * максимальный размер числа, 2000 байт. Хранить достаточно заданное
количество чисел.

## Report

Сделан гем test_gem, на rubygems - не выложен. установка с гитхаба.
```
git clone https://github.com/afalone/test_gem.git
```

```
cd test_gem
bundle install
exe/test_gem <FILE>
rspec
firefox coverage/index.html
```

travis - не интегрировал. Внезапно узнал, что гитхаб заблокировал мне покупку интеграции travis ci на сумму $0.
Если необходимо могу на гитлаб выложить и сделать gitlab ci.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TestGem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/test_gem/blob/master/CODE_OF_CONDUCT.md).
