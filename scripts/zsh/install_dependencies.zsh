i() {
	if ! [[ -f "package.json" ]]; then
		echo "The package.json doesn't exists"
		return
	fi

	if [[ -f "pnpm-lock.yaml" ]]; then
		echo "⏵ Detectando pnpm-lock.yaml, usando pnpm..."
		pnpm install
	elif [[ -f "bun.lockb" ]]; then
		echo "⏵ Detectando bun.lockb, usando bun..."
		bun install
	elif [[ -f "package-lock.json" ]]; then
		echo "⏵ Detectando package-lock.json, usando npm..."
		npm install
	elif [[ -f "yarn.lock" ]]; then
		echo "⏵ Detectando yarn.lock, usando yarn..."
		yarn install
	else
		echo "No se detecto ningún archivo de bloqueo, usando por defecto..."
		pnpm install
	fi
}
