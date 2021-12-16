name: 🔂 Surge PR Preview

on: [pull_request]

jobs:
  preview:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install pnpm
        run: npm i -g pnpm

      - name: install surge
      	run: pnpm i -g surge

      - name: Build Site
        run: pnpm i && pnpm run build
	
      - name: Deploy to surge.sh
      	run: surge ./build 'flucoma-learn-pr${{ github.event.number }}.surge.sh' --token ${{ secrets.SURGE_TOKEN }}
