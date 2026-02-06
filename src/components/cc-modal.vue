<template>
  <Teleport to="body">
    <Transition name="modal">
      <div v-if="modelValue" class="cc-modal-overlay" @click.self="handleOverlayClick">
        <div class="cc-modal-container" :class="[`cc-modal--${size}`]">
          <div class="cc-modal-header">
            <slot name="header" />
          </div>
          <slot />
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
defineProps<{
  modelValue: boolean
  size?: 'small' | 'medium' | 'large'
}>()

const emit = defineEmits<{
  (e: 'update:modelValue', value: boolean): void
  (e: 'close'): void
}>()

function handleOverlayClick() {
  emit('update:modelValue', false)
  emit('close')
}
</script>

<style scoped>
.cc-modal-overlay {
  position: fixed;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.77);
  z-index: 1000;
  padding: 20px;
}

.cc-modal-container {
  position: relative;
  background: #262421;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.65);
}

.cc-modal-header {
  position: absolute;
  top: 0;
  right: 0;
  z-index: 10;
}

.cc-modal--small {
  width: 400px;
  max-width: 100%;
  padding: 24px 12px;
}

.cc-modal--medium {
  width: 560px;
  max-width: 100%;
}

.cc-modal--large {
  width: 800px;
  max-width: 100%;
}

/* Transitions */
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.25s ease;
}

.modal-enter-active .cc-modal-container,
.modal-leave-active .cc-modal-container {
  transition: transform 0.25s ease, opacity 0.25s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-enter-from .cc-modal-container,
.modal-leave-to .cc-modal-container {
  transform: scale(0.95) translateY(10px);
}
</style>
