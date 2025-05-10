# mohit_portfolio_flutter_web

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



deploy proccess 


flutter build web --base-href="/mohit_portfolio_flutter/"
cd build/web
git init
git remote add origin https://github.com/MohitNemade27/mohit_portfolio_flutter.git
git checkout -b gh-pages
git add .
git commit -m "Deploy Flutter Web"
git push -f origin gh-pages