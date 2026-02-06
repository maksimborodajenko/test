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

    <!-- Hero Image -->
    <img
      class="hero-image"
      src="@/assets/coaches-promo.png"
      alt="New coaches including Mittens, Dr. Wolf, and Sloane"
    />

    <!-- Content -->
    <div class="content">
      <h2 class="title">New Coaches Available</h2>
      <p class="description">
        Try out our new coaches like Mittens, Dr. Wolf, and Sloane. 
        Find the coach that matches your style!
      </p>

      <CcButton
        variant="primary"
        size="large"
        full-width
        @click="handleChooseCoach"
      >
        Choose Your Coach
      </CcButton>
    </div>
  </CcModal>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import CcModal from './cc-modal.vue'
import CcButton from './cc-button.vue'
import CcCloseButton from './cc-close-button.vue'

const props = defineProps<{
  modelValue?: boolean
}>()

const emit = defineEmits<{
  (e: 'update:modelValue', value: boolean): void
  (e: 'choose-coach'): void
  (e: 'close'): void
}>()

const isOpen = computed({
  get: () => props.modelValue ?? false,
  set: (value: boolean) => emit('update:modelValue', value)
})

function handleClose() {
  emit('update:modelValue', false)
  emit('close')
}

function handleChooseCoach() {
  emit('choose-coach')
  handleClose()
}
</script>

<style scoped>
.hero-image {
  width: 100%;
  height: 300px;
  object-fit: cover;
  object-position: center top;
}

.content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
  padding: 24px 16px;
  text-align: center;
}

.title {
  margin: 0;
  font-size: 28px;
  font-weight: 800;
  line-height: 1.14;
  color: #ffffff;
}

.description {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
  line-height: 1.5;
  color: rgba(255, 255, 255, 0.72);
}
</style>
