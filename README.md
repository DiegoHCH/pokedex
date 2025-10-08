# 🎮 Pokedex

Una aplicación Flutter moderna y elegante para explorar el mundo Pokémon. Desarrollada con arquitectura limpia y mejores prácticas de Flutter.

## ✨ Características

- 🎨 **Interfaz moderna** con diseño limpio y atractivo
- 🔍 **Búsqueda inteligente** con debouncer para optimizar rendimiento
- 🎯 **Filtros avanzados** por tipo de Pokémon
- 📱 **Multiplataforma** (Android, iOS, Web, Windows, Linux, macOS)
- 🏗️ **Arquitectura limpia** con separación de responsabilidades
- 🔄 **Gestión de estado** con Riverpod
- 🌐 **API REST** con PokeAPI
- 💾 **Favoritos locales** con SharedPreferences
- 🎭 **Onboarding** interactivo para nuevos usuarios
- 📊 **Scroll infinito** para carga eficiente de datos
- 🎨 **Splash screen** personalizado

## 🚀 Tecnologías Utilizadas

### Core
- **Flutter** 3.29.3 - Framework de desarrollo
- **Dart** 3.7.2+ - Lenguaje de programación

### Estado y Navegación
- **Riverpod** ^3.0.1 - Gestión de estado reactiva
- **GoRouter** ^16.2.4 - Navegación declarativa

### UI/UX
- **Google Fonts** ^6.2.1 - Tipografías personalizadas
- **Animate Do** ^4.2.0 - Animaciones fluidas
- **Material Design** - Sistema de diseño

### Networking
- **Dio** ^5.9.0 - Cliente HTTP robusto
- **PokeAPI** - API externa para datos de Pokémon

### Almacenamiento
- **Shared Preferences** ^2.2.2 - Persistencia local

### Utilidades
- **Flutter Native Splash** ^2.4.6 - Pantalla de carga
- **Flutter Launcher Icons** ^0.14.4 - Iconos personalizados

## 📱 Capturas de Pantalla

### Pantalla Splash
![Pantalla Splash](https://github.com/DiegoHCH/images_readme/blob/master/splash_pokedex.png?raw=true)

### Onboarding
![Onboarding 1](https://github.com/DiegoHCH/images_readme/blob/master/onboarding_1.png?raw=true)
![Onboarding 2](https://github.com/DiegoHCH/images_readme/blob/master/onboarding_2.png?raw=true)

### Pantalla Principal
![Pokedex](https://github.com/DiegoHCH/images_readme/blob/master/home_pokedex.png?raw=true)

### Filtros
![Filtros](https://github.com/DiegoHCH/images_readme/blob/master/filter_pokedex.png?raw=true)

### Detalle de Pokémon
![Detalle](https://github.com/DiegoHCH/images_readme/blob/master/detail_pokedex.png?raw=true)

### Favoritos
![Favoritos](https://github.com/DiegoHCH/images_readme/blob/master/favorite_pokedex.png?raw=true)

## 🏗️ Arquitectura

La aplicación sigue una **arquitectura limpia** con las siguientes capas:

```
lib/
├── config/           # Configuración global
│   ├── constants/    # Constantes y assets
│   ├── router/       # Configuración de navegación
│   ├── theme/        # Temas y estilos
│   └── utils/        # Utilidades globales
├── domain/           # Lógica de negocio
│   ├── entities/     # Modelos de dominio
│   ├── repositories/ # Contratos de repositorios
│   └── datasources/  # Contratos de fuentes de datos
├── infrastructure/   # Implementación
│   ├── datasources/ # Implementación de APIs
│   ├── models/      # Modelos de datos
│   ├── mappers/     # Convertidores de datos
│   └── repositories/# Implementación de repositorios
└── presentation/    # Interfaz de usuario
    ├── screens/     # Pantallas de la aplicación
    ├── widgets/     # Componentes reutilizables
    └── providers/   # Gestión de estado UI
```

## 🚀 Instalación y Configuración

### Prerrequisitos

- Flutter SDK 3.29.3
- Dart SDK 3.7.2 o superior
- Android Studio / VS Code
- Git

### Pasos de Instalación

1. **Clona el repositorio**
   ```bash
   git clone https://github.com/tu-usuario/pokedex.git
   cd pokedex
   ```

2. **Instala las dependencias**
   ```bash
   flutter pub get
   ```

3. **Genera los iconos de la aplicación**
   ```bash
   dart run flutter_launcher_icons
   ```

4. **Genera la pantalla de splash**
   ```bash
   dart run flutter_native_splash:create
   ```

### Ejecutar la Aplicación

```bash
# Desarrollo
flutter run

# Modo release
flutter run --release

# Plataforma específica
flutter run -d android
flutter run -d ios
flutter run -d web
```

## 🔧 Configuración de Desarrollo

### Estructura de Archivos Importantes

- **`lib/config/constants/assets.dart`** - Definición de assets
- **`lib/config/router/app_router.dart`** - Configuración de rutas
- **`lib/config/theme/app_theme.dart`** - Temas de la aplicación
- **`lib/infrastructure/datasources/pokeapi_datasource.dart`** - Cliente API
- **`lib/presentation/providers/`** - Providers de Riverpod

### Características Técnicas

- **Búsqueda con Debouncer**: Optimiza las consultas API
- **Scroll Infinito**: Carga eficiente de Pokémon
- **Filtros por Tipo**: Búsqueda avanzada por características
- **Persistencia Local**: Favoritos guardados localmente
- **Gestión de Estado**: Riverpod para estado reactivo
- **Navegación Declarativa**: GoRouter para rutas limpias

## 🎯 Funcionalidades Principales

### 🔍 Búsqueda Inteligente
- Búsqueda en tiempo real con debouncer de 500ms
- Búsqueda local primero, luego API
- Restauración automática de lista al limpiar búsqueda

### 🎨 Filtros Avanzados
- Modal de filtros por tipo de Pokémon
- Persistencia de filtros seleccionados
- Deshabilitación de scroll infinito con filtros activos
- Botón "Borrar filtro" para limpiar selección

### 💾 Sistema de Favoritos
- Agregar/quitar Pokémon de favoritos
- Persistencia local con SharedPreferences
- Pantalla dedicada de favoritos
- Indicadores visuales de estado

### 📱 Experiencia de Usuario
- Onboarding interactivo para nuevos usuarios
- Splash screen personalizado
- Navegación por tabs intuitiva
- Estados de carga y error manejados

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Patrones de Diseño Implementados

- **Repository Pattern**: Para abstracción de datos
- **Provider Pattern**: Para gestión de estado
- **Clean Architecture**: Separación de responsabilidades
- **Singleton**: Para clientes HTTP
- **Observer**: Para reactividad con Riverpod

## 🐛 Solución de Problemas

### Error de Conexión API
- Verifica que tengas conexión a internet
- La API de PokeAPI es gratuita y no requiere autenticación

### Problemas de Build
- Ejecuta `flutter clean`
- Ejecuta `flutter pub get`
- Verifica la versión de Flutter

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👨‍💻 Autor

**Diego Hoyos**
- GitHub: [@DiegoHCH](https://github.com/DiegoHCH)
- LinkedIn: [diegohoyos92](https://www.linkedin.com/in/diegohoyos92/)

## 🙏 Agradecimientos

- [PokeAPI](https://pokeapi.co/) por proporcionar la API gratuita de Pokémon
- [Flutter Team](https://flutter.dev/) por el increíble framework
- Comunidad de Flutter por las librerías utilizadas
- Nintendo/Game Freak por crear el universo Pokémon

## 🎮 Sobre Pokémon

Esta aplicación utiliza datos de la API pública de PokeAPI, que contiene información oficial de Pokémon de todas las generaciones. Los datos incluyen estadísticas, tipos, habilidades, descripciones y más.

---

⭐ **¡Si te gusta este proyecto, no olvides darle una estrella!** ⭐

🎮 **Gotta catch 'em all!** 🎮