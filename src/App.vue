<template>
  <div class="demo-container">
    <button class="show-modal-btn" @click="showModal = true">
      Show Chess Term Modal (Design System Test)
    </button>

    <ChessTermModalDS
      v-model="showModal"
      term="File"
      definition="In chess, a &quot;file&quot; is a vertical column on the chessboard, labeled 'a' to 'h' from left to right.

Files are used in chess notation to describe moves, such as &quot;e4,&quot; indicating a move to the 4th rank on the 'e' file."
      :board-image="boardImage"
      @got-it="handleGotIt"
      @close="handleClose"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, provide } from 'vue'
import ChessTermModalDS from './components/ChessTermModalDS.vue'
import boardImage from './assets/file-diagram-271dbd.png'

// Provide design system context
provide('design-system-key', {
  routes: {
    webMemberView: (username: string) => `/member/${username}`,
    webAbout: '/about',
    webMembership: (_params: Record<string, string>) => `/membership`,
    webMemberTitledPlayers: '/titled-players',
  },
  trans: (key: string) => key, // Simple pass-through for translations
})

const showModal = ref(true)

function handleGotIt() {
  console.log('User clicked Got it!')
}

function handleClose() {
  console.log('Modal closed')
}
</script>

<style scoped>
.demo-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 2rem;
  min-height: 100vh;
  padding: 2rem;
}

.show-modal-btn {
  padding: 1.2rem 2.4rem;
  font-size: 1.6rem;
  font-weight: 600;
  color: var(--color-text-inverse, #ffffff);
  background: var(--color-bg-tertiary, #3d3d3d);
  border: none;
  border-radius: 0.8rem;
  cursor: pointer;
  transition: background 0.2s;
}

.show-modal-btn:hover {
  background: var(--color-bg-secondary, #4d4d4d);
}
</style>
