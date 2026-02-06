<template>
  <CcModal
    v-model="isOpen"
    size="small"
    @close="handleClose"
  >
    <template #header>
      <CcCloseButton
        variant="subtle"
        size="large"
        @click="handleClose"
      />
    </template>

    <!-- Title -->
    <h2 class="title">{{ term }}</h2>

    <!-- Board Diagram -->
    <div class="board-wrapper">
      <img
        class="board-image"
        :src="boardImage"
        :alt="`Chess board showing ${term}`"
      />
    </div>

    <!-- Content + CTA -->
    <div class="content">
      <p class="definition">{{ definition }}</p>

      <CcButton
        variant="primary"
        size="large"
        full-width
        @click="handleGotIt"
      >
        Got it!
      </CcButton>
    </div>
  </CcModal>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import CcModal from './cc-modal.vue'
import CcButton from './cc-button.vue'
import CcCloseButton from './cc-close-button.vue'

const props = withDefaults(defineProps<{
  modelValue?: boolean
  term?: string
  definition?: string
  boardImage?: string
}>(), {
  modelValue: false,
  term: 'File',
  definition: 'In chess, a "file" is a vertical column on the chessboard, labeled \'a\' to \'h\' from left to right.\n\nFiles are used in chess notation to describe moves, such as "e4," indicating a move to the 4th rank on the \'e\' file.',
  boardImage: ''
})

const emit = defineEmits<{
  (e: 'update:modelValue', value: boolean): void
  (e: 'got-it'): void
  (e: 'close'): void
}>()

const isOpen = computed({
  get: () => props.modelValue,
  set: (value: boolean) => emit('update:modelValue', value)
})

function handleClose() {
  emit('update:modelValue', false)
  emit('close')
}

function handleGotIt() {
  emit('got-it')
  handleClose()
}
</script>

<style scoped>
.title {
  margin: 0;
  font-family: 'Chess Sans', sans-serif;
  font-size: 22px;
  font-weight: 800;
  line-height: 1.27;
  color: #ffffff;
  text-align: left;
}

.board-wrapper {
  display: flex;
  justify-content: center;
  padding: 24px 0;
}

.board-image {
  width: 200px;
  height: 200px;
  border-radius: 3px;
  object-fit: cover;
}

.content {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.definition {
  margin: 0;
  font-family: 'Inter', sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 1.5;
  color: var(--color-text-bolder, var(--color-gray-700, rgba(255, 255, 255, 0.85)));
  white-space: pre-line;
}
</style>
