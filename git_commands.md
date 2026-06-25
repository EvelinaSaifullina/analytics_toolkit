## 1. Представься Git (один раз на компьютер)
git config --global user.name "Your_user.name"
git config --global user.email "Your_user.email"
#### Это нужно, чтобы твои коммиты были подписаны твоим именем.

## 2. (Опционально) Настрой редактор для сообщений коммитов (VS Code)
git config --global core.editor "code --wait"

## 3. Перейди в папку с проектом
cd путь_к_папке

## 4. Инициализируй Git (создаёт скрытую папку .git)
git init

## 5. Создай файл .gitignore (чтобы Git игнорировал большие файлы и мусор)
echo ".ipynb_checkpoints/" > .gitignore
echo "__pycache__/" >> .gitignore
echo "*.csv" >> .gitignore
echo ".DS_Store" >> .gitignore
#### Это защитит тебя от случайной загрузки гигабайтов данных на GitHub.


## 6. Проверь, какие файлы видит Git
git status
#### Ты увидишь список файлов, которые ещё не добавлены (красные).

## 7. Добавь все файлы (кроме тех, что в .gitignore) в staging area
git add .
#### Это значит: "Git, приготовь все файлы для сохранения".

## 8. Посмотри, что попало в staging area
git status
#### Теперь файлы — зелёные. Это значит, они готовы к коммиту.

## 9. Создай коммит с осмысленным сообщением
git commit -m "feat: add A/B test analysis with statistical significance and visualization"
#### Структура сообщения: тип_изменения: краткое_описание
#### Типы: feat, fix, docs, refactor, test, chore.

## 10. Посмотри историю коммитов (убедись, что коммит создан)
git log --oneline
#### Ты увидишь короткий хэш коммита и твоё сообщение.

## 11. Добавь ссылку на удалённый репозиторий (замени URL на свой)
git remote add origin *твой_URL*
#### Это связывает твой локальный проект с репозиторием на GitHub.

## 12. Проверь, что привязка создалась
git remote -v
#### Должны показаться две строки с твоим URL (fetch и push).

## 13. Отправь коммит на GitHub
git push -u origin main
#### -u — устанавливает связь между локальной веткой main и удалённой origin/main.
#### В следующий раз можно будет просто писать git push.
