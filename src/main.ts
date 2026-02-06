// Design System CSS imports (ORDER MATTERS)
import '@chesscom/design-system/dist/variables.css'  // CSS custom properties (tokens)
import '@chesscom/design-system/dist/cc-utils.css'   // Utility classes
import '@chesscom/design-system/dist/style.css'      // Component styles

// Local styles
import './style.css'

import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
