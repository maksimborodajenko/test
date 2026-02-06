<template>
  <button
    class="cc-button"
    :class="[
      `cc-button--${variant}`,
      `cc-button--${size}`,
      { 'cc-button--full-width': fullWidth }
    ]"
    :disabled="disabled || loading"
    @click="$emit('click', $event)"
  >
    <span v-if="loading" class="cc-button__spinner" />
    <slot />
  </button>
</template>

<script setup lang="ts">
defineProps<{
  variant?: 'primary' | 'secondary' | 'basic' | 'danger'
  size?: 'small' | 'medium' | 'large'
  disabled?: boolean
  loading?: boolean
  icon?: string
  iconPosition?: 'left' | 'right'
  fullWidth?: boolean
}>()

defineEmits<{
  (e: 'click', event: MouseEvent): void
}>()
</script>

<style scoped>
.cc-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-8, 8px);
  font-family: 'Chess Sans', 'Inter', sans-serif;
  font-weight: 800;
  border: none;
  border-radius: var(--radius-10, 10px);
  cursor: pointer;
  transition: all var(--motion-duration-fast, 150ms) var(--motion-easing-standard, ease);
}

.cc-button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

/* Variants */
.cc-button--primary {
  background: linear-gradient(180deg, #81b64c 0%, #5d9948 100%);
  color: var(--color-text-inverse, #ffffff);
  box-shadow: 
    0px 2px 4px 0px rgba(0, 0, 0, 0.1),
    0px 1px 2px 0px rgba(0, 0, 0, 0.14),
    inset 0px -2px 4px 0px rgba(69, 117, 60, 0.5),
    inset 0px 2px 4px 0px rgba(178, 224, 104, 0.5),
    inset 0px -1px 0px 0px rgba(69, 117, 60, 1),
    inset 0px 1px 0px 0px rgba(178, 224, 104, 0.4);
}

.cc-button--primary:hover:not(:disabled) {
  filter: brightness(1.05);
  transform: translateY(-1px);
}

.cc-button--primary:active:not(:disabled) {
  filter: brightness(0.95);
  transform: translateY(0);
}

.cc-button--secondary {
  background: var(--color-transparent-white-10, rgba(255, 255, 255, 0.1));
  color: var(--color-text-inverse, #ffffff);
}

.cc-button--secondary:hover:not(:disabled) {
  background: var(--color-transparent-white-40, rgba(255, 255, 255, 0.4));
}

/* Sizes */
.cc-button--small {
  padding: var(--space-8, 8px) var(--space-12, 12px);
  font-size: 14px;
}

.cc-button--medium {
  padding: var(--space-12, 12px) var(--space-16, 16px);
  font-size: 16px;
}

.cc-button--large {
  padding: var(--space-16, 16px);
  font-size: 22px;
  line-height: 1.27;
}

/* Full width */
.cc-button--full-width {
  width: 100%;
}

/* Spinner */
.cc-button__spinner {
  width: 16px;
  height: 16px;
  border: 2px solid currentColor;
  border-top-color: transparent;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}
</style>
