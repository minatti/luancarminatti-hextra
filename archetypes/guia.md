---
title: '{{ replace .File.ContentBaseName "-" " " | title }}'
date: {{ .Date }}
draft: true
description: ""
categories:
  - Guia rápido
tags: []
---

# {{ replace .File.ContentBaseName "-" " " | title }}

## 🧭 Introdução

Explicação breve sobre o que é e para que serve.

## 📌 Comandos / Conceitos

| Ação                     | Comando / Conceito                |
|--------------------------|----------------------------------|
| Iniciar projeto Hugo     | `hugo new site nome-do-site`     |
| Rodar local              | `hugo server -D`                 |

## 🔗 Dicas extras

- Use `hugo mod` para...
- Combine com tema X para Y

## 📚 Fontes

- [Documentação oficial](https://gohugo.io/)
