<template>
  <div class="play-coach-content">
    <!-- Coach Message -->
    <div class="coach-message">
      <div class="coach-avatar">
        <img :src="coachAvatar" alt="Coach" />
      </div>
      <div class="speech-bubble">
        <div class="message">
          <span class="message-text">
            Taking the open
            <button class="term-highlight" @click="$emit('term-click', 'file')">
              file
            </button>
            with your rook.
          </span>
        </div>
      </div>
    </div>

    <!-- Chess Board -->
    <div class="board-container">
      <img class="board" :src="boardImage" alt="Chess board position" />
    </div>
  </div>
</template>

<script setup lang="ts">
import coachAvatar from '@/assets/coach-nadia.png'
import boardImage from '@/assets/chessboard-play.png'

defineEmits<{
  (e: 'term-click', term: string): void
}>()
</script>

<style scoped>
.play-coach-content {
  display: flex;
  flex-direction: column;
  gap: 12px;
  padding: 0 24px;
  width: 100%;
  max-width: 810px;
}

/* Coach Message */
.coach-message {
  display: flex;
  align-items: flex-end;
  gap: -4px;
}

.coach-avatar {
  flex-shrink: 0;
}

.coach-avatar img {
  width: 96px;
  height: 96px;
  border-radius: 50%;
}

.speech-bubble {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.message {
  display: flex;
  flex-direction: column;
  gap: 16px;
  background: #ffffff;
  border-radius: 10px;
  padding: 12px 16px;
}

.message-text {
  font-family: 'Inter', sans-serif;
  font-size: 15px;
  font-weight: 500;
  line-height: 1.33;
  color: #312E2B;
}

.term-highlight {
  display: inline-flex;
  justify-content: center;
  align-items: center;
  padding: 2px 4px 4px;
  background: #F1F1F1;
  border: none;
  border-radius: 3px;
  box-shadow: inset 0px -2px 0px 0px rgba(190, 189, 185, 1);
  font-family: 'Inter', sans-serif;
  font-size: 15px;
  font-weight: 500;
  line-height: 1.33;
  color: #312E2B;
  cursor: pointer;
  transition: background 0.15s ease;
}

.term-highlight:hover {
  background: #E5E5E5;
}

/* Chess Board */
.board-container {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 12px 0;
}

.board {
  width: 100%;
  max-width: 762px;
  height: auto;
  aspect-ratio: 1;
  border-radius: 4px;
}
</style>
