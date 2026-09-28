# Atalhos de terminal. `make` sem argumentos lista os comandos.
#   make demo              # simulador no dispositivo selecionado
#   make dev DEVICE=chrome # gateway real no Chrome

DEVICE ?=
DEVICE_FLAG := $(if $(DEVICE),-d $(DEVICE),)

.DEFAULT_GOAL := help
.PHONY: help dev demo web gen watch test analyze check clean apk

help: ## Lista os comandos
	@grep -E '^[a-z]+:.*## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  make %-8s %s\n", $$1, $$2}'

dev: ## Roda com o gateway real (ENVIRONMENT=dev)
	flutter run $(DEVICE_FLAG) --dart-define=ENVIRONMENT=dev

demo: ## Roda com o simulador embutido (ENVIRONMENT=demo)
	flutter run $(DEVICE_FLAG) --dart-define=ENVIRONMENT=demo

web: ## Simulador no Chrome
	flutter run -d chrome --dart-define=ENVIRONMENT=demo

gen: ## Gera código freezed/json
	dart run build_runner build

watch: ## Gera código continuamente
	dart run build_runner watch

test: ## Roda os testes
	flutter test

analyze: ## Análise estática
	flutter analyze

check: analyze test ## Análise + testes

clean: ## Limpa, reinstala dependências e regera código
	flutter clean && flutter pub get && dart run build_runner build

apk: ## APK release apontando para o gateway real
	flutter build apk --release --dart-define=ENVIRONMENT=dev
