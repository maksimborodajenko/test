<template>
  <svg
    class="cc-icon"
    :class="[`cc-icon--${size}`]"
    :style="color ? { color } : undefined"
    viewBox="0 0 24 24"
    fill="none"
    xmlns="http://www.w3.org/2000/svg"
  >
    <!-- mark-cross -->
    <template v-if="glyph === 'mark-cross'">
      <path
        d="M18 6L6 18M6 6L18 18"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
    </template>

    <!-- arrow-chevron-left -->
    <template v-else-if="glyph === 'arrow-chevron-left'">
      <path
        d="M15 18L9 12L15 6"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
    </template>

    <!-- arrow-chevron-right -->
    <template v-else-if="glyph === 'arrow-chevron-right'">
      <path
        d="M9 18L15 12L9 6"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
    </template>

    <!-- Fallback -->
    <template v-else>
      <rect x="4" y="4" width="16" height="16" stroke="currentColor" stroke-width="2" rx="2" />
    </template>
  </svg>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  glyph: string
  size?: 'small' | 'medium' | 'large'
  color?: string
}>(), {
  size: 'medium'
})
</script>

<style scoped>
.cc-icon {
  display: inline-block;
  flex-shrink: 0;
}

.cc-icon--small {
  width: 16px;
  height: 16px;
}

.cc-icon--medium {
  width: 20px;
  height: 20px;
}

.cc-icon--large {
  width: 24px;
  height: 24px;
}
</style>
