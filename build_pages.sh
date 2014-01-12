grunt build:prod
cd build
git init
git remote add origin git@github.com:blainesch/crafty-snake.git
git checkout -b gh-pages
git add -A
git commit -m "Autogenerate build."
git push -f origin gh-pages
