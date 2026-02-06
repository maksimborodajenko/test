// TypeScript declarations for Chess.com Design System globals
declare global {
  interface Window {
    chesscom?: {
      features?: string[]
      settings?: Record<string, unknown>
    }
    context?: Record<string, unknown>
  }
}

export {}
