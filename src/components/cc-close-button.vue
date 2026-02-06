<template>
  <button
    class="cc-close-button"
    :class="[`cc-close-button--${variant}`, `cc-close-button--${size}`]"
    aria-label="Close"
    @click="$emit('click')"
  >
    <CcIcon glyph="mark-cross" :size="iconSize" />
  </button>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import CcIcon from './cc-icon.vue'

const props = withDefaults(defineProps<{
  size?: 'small' | 'medium' | 'large'
  variant?: 'subtle' | 'default'
}>(), {
  size: 'large',
  variant: 'subtle'
})

defineEmits<{
  (e: 'click'): void
}>()

const iconSize = computed(() => {
  switch (props.size) {
    case 'small': return 'small'
    case 'medium': return 'medium'
    case 'large': return 'large'
    default: return 'medium'
  }
})
</script>

<style scoped>
.cc-close-button {
  display: flex;
  align-items: center;
  justify-content: center;
  border: none;
  border-radius: var(--radius-6, 6px);
  cursor: pointer;
  transition: all var(--motion-duration-fast, 150ms) var(--motion-easing-standard, ease);
}

/* Variants */
.cc-close-button--subtle {
  background: transparent;
  color: var(--color-icon-subtle, rgba(255, 255, 255, 0.4));
}

.cc-close-button--subtle:hover {
  color: var(--color-icon-default, #8B8987);
}

.cc-close-button--default {
  background: var(--color-transparent-white-10, rgba(255, 255, 255, 0.1));
  color: var(--color-text-inverse, #ffffff);
}

.cc-close-button--default:hover {
  background: var(--color-transparent-white-20, rgba(255, 255, 255, 0.2));
}

/* Sizes */
.cc-close-button--small {
  width: 24px;
  height: 24px;
  padding: 4px;
}

.cc-close-button--medium {
  width: 32px;
  height: 32px;
  padding: 6px;
}

.cc-close-button--large {
  width: 48px;
  height: 48px;
  padding: var(--space-12, 12px);
  gap: 8px;
}
</style>
