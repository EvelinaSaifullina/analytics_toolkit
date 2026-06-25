# Git Workflow

## 🚀 Первый запуск (один раз на компьютер)

```bash
# Представься Git (подпишет твои коммиты)
git config --global user.name "твой_user.name"
git config --global user.email "твой_user.email"

🧱 1. Начало проекта (локально)
# Перейди в папку с проектом
cd /путь/к/папке

# Инициализируй Git (создаётся скрытая папка .git)
git init

# Создай .gitignore (чтобы не загружать мусор)
echo ".ipynb_checkpoints/" > .gitignore
echo "__pycache__/" >> .gitignore
echo "*.csv" >> .gitignore

📦 2. Первый коммит
# Добавь все файлы в коммит
git add .

# Посмотри, что попало в коммит
git status

# Сохрани коммит с описанием
git commit -m "feat: add A/B test analysis with statistical significance"

Шаблоны текста для коммита:
feat: add A/B test analysis with statistical significance
fix: correct confidence interval calculation
docs: update README with results
refactor: simplify SQL query for funnel

🌐 3. Связь с GitHub (первый раз)
# Добавь ссылку на пустой репозиторий на GitHub
git remote add origin *ссылка на репозиторий*

# Проверь, что привязка создалась
git remote -v

# Отправь на GitHub (флаг -u запоминает ветку)
git push -u origin main

🔄 4. Повседневный цикл
# Проверь, что изменилось
git status

# Добавь все изменения
git add .

# Сделай коммит
git commit -m "fix: update confidence intervals in A/B test"

# Отправь на GitHub
git push

⏪ 5. Отмена действий
# Отменить последний коммит (сохранить изменения)
git reset --soft HEAD~1

# Отменить все изменения в файле (вернуть к последнему коммиту)
git checkout -- имя_файла.ipynb

# Убрать файл из коммита, но оставить локально
git rm --cached большой_файл.csv
❗ 6. Частые ошибки
Ошибка                              | Команда 
remote origin already exists        | git remote set-url origin https://новый_репозиторий.git 
Updates were rejected               | git pull origin main --allow-unrelated-histories 
author identity unknown	            | git config --global user.name "Имя" и git config --global user.email "почта" 
src refspec main does not match any | git branch -M main 

✅ Что проверить перед пушем
# Проверь, что в коммит не попали большие файлы
du -sh .git
# Проверь историю
git log --oneline -3

# Проверь статус (всё добавлено?)
git status

🏁 Финальный пуш

git push
