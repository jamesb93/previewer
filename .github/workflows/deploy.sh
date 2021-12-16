name: 🔂 Surge PR Preview

on: [pull_request]

jobs:
  preview:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: afc163/surge-preview@v1
        id: generate_preview
        with:
          surge_token: ${{ secrets.SURGE_TOKEN }}
          github_token: ${{ secrets.GITHUB_TOKEN }}
          dist: build
          teardown: true
          build: |
            npm install
            npm run build
            
      - name: Get the preview_url
        run: echo "url => ${{ steps.preview_step.outputs.preview_url }}"
