<template>
  <CcModal
    v-model="isOpen"
    size="small"
    :closable="false"
    @close="handleClose"
  >
    <!-- Modal Content with relative positioning for close button -->
    <div class="modal-container">
      <!-- Close Button - positioned absolute top-right -->
      <CcCloseButton
        class="close-button"
        size="large"
        variant="subtle"
        @click="handleClose"
      />

      <!-- Modal Body -->
      <div class="modal-body">
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
        <div class="content-cta">
          <!-- Definition Text -->
          <p class="definition">{{ definition }}</p>

          <!-- Got it! Button -->
          <CcButton
            variant="primary"
            size="x-large"
            full-width
            @click="handleGotIt"
          >
            Got it!
          </CcButton>
        </div>
      </div>
    </div>
  </CcModal>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { CcButton, CcModal, CcCloseButton } from '@chesscom/design-system'

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
/* Container with relative positioning for close button and width constraints */
.modal-container {
  position: relative;
  min-width: 30rem;
  max-width: 40rem;
}

/* Close button - absolute positioned top-right per Figma */
.close-button {
  position: absolute;
  top: 0;
  right: 0;
  z-index: 1;
}

/* Modal body with Figma-specified padding: 32px top, 12px horizontal, 24px bottom */
.modal-body {
  display: flex;
  flex-direction: column;
  align-items: stretch;
  padding: var(--space-32) var(--space-12) var(--space-24);
  gap: var(--space-24);
}

/* Title - Figma: heading-x-small-bold (Chess Sans, 22px, 800 weight, left aligned) */
.title {
  margin: 0;
  font-family: var(--font-family-heading, 'Chess Sans', sans-serif);
  font-size: 2.2rem;
  font-weight: 800;
  line-height: 1.27;
  text-align: left;
  color: var(--color-text-boldest);
}

/* Board wrapper - center the board image */
.board-wrapper {
  display: flex;
  justify-content: center;
  align-self: center;
}

/* Board image - 200x200, 3px border radius */
.board-image {
  width: 20rem;
  height: 20rem;
  border-radius: 0.3rem;
  object-fit: cover;
}

/* Content + CTA container - 16px gap */
.content-cta {
  display: flex;
  flex-direction: column;
  align-self: stretch;
  gap: var(--space-16);
}

/* Definition text - Figma: paragraph-large (System font, 15px, 400 weight, left aligned) */
.definition {
  margin: 0;
  font-family: var(--font-family-system, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif);
  font-size: 1.5rem;
  font-weight: 400;
  line-height: 1.47;
  text-align: left;
  color: rgba(255, 255, 255, 0.85);
  white-space: pre-line;
}
</style>
