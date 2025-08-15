#!/bin/bash

# === CONFIGURAÇÃO GERAL ===
SRC_DIR="content/pt-br"
DEST_DIR="content/en"

# === FUNÇÕES ===

exibir_titulo() {
  echo "🔁 Clonador de Conteúdo Multilíngue (Hugo)"
  echo "Origem: $SRC_DIR"
  echo "Destino: $DEST_DIR"
  echo
}

perguntar_usuario() {
  read -rp "👉 Copiar arquivos .md? (s/n): " COPIAR_MD
  read -rp "👉 Adicionar 'draft: true'? (s/n): " ADICIONAR_DRAFT
  read -rp "👉 Limpar conteúdo e manter apenas o front matter? (s/n): " LIMPAR_CONTEUDO
  echo
}

criar_destino() {
  mkdir -p "$DEST_DIR"
}

copiar_arquivo() {
  local src="$1"
  local rel_path="${src#$SRC_DIR/}"
  local dest="$DEST_DIR/$rel_path"

  mkdir -p "$(dirname "$dest")"

  if [[ "$COPIAR_MD" == "s" ]]; then
    if [[ "$LIMPAR_CONTEUDO" == "s" ]]; then
      extrair_front_matter "$src" > "$dest"
    else
      cp "$src" "$dest"
    fi

    if [[ "$ADICIONAR_DRAFT" == "s" ]]; then
      adicionar_draft "$dest"
    fi

    echo "✔ $rel_path copiado"
  fi
}

extrair_front_matter() {
  # Extrai blocos entre os dois ---
  awk '
    BEGIN {count=0}
    /^---$/ {count++; print; next}
    count == 1 {print}
    count == 2 {exit}
  ' "$1"
}

adicionar_draft() {
  local file="$1"

  # Verifica se 'draft' já existe
  if ! grep -q "^draft:" "$file"; then
    # Insere após primeira linha '---'
    awk '
      BEGIN {done=0}
      /^---$/ && !done {
        print; getline; print "draft: true"; print;
        done=1; next
      }
      {print}
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
  fi
}

processar_arquivos() {
  find "$SRC_DIR" -type f -name "*.md" | while read -r file; do
    copiar_arquivo "$file"
  done
}

# === EXECUÇÃO PRINCIPAL ===

exibir_titulo
perguntar_usuario
criar_destino
processar_arquivos

echo
echo "✅ Concluído. Verifique '$DEST_DIR' para os arquivos clonados."
