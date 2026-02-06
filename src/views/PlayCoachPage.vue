<template>
  <div class="play-coach-page">
    <!-- Navigation -->
    <nav class="nav-bar">
      <div class="nav-top">
        <div class="logo">
          <div class="logo-icon"></div>
          <span class="logo-text">Chess.com</span>
        </div>
        <div class="nav-links">
          <a href="#" class="nav-link active">
            <span class="icon icon-play"></span>
            <span class="nav-text">Play</span>
          </a>
          <a href="#" class="nav-link">
            <span class="icon icon-puzzle"></span>
            <span class="nav-text">Puzzles</span>
          </a>
          <a href="#" class="nav-link">
            <span class="icon icon-learn"></span>
            <span class="nav-text">Learn</span>
          </a>
          <a href="#" class="nav-link">
            <span class="icon icon-train"></span>
            <span class="nav-text">Train</span>
          </a>
          <button class="nav-link more-btn" @click="showMore = !showMore">
            <span class="nav-text">{{ showMore ? 'Less' : 'More' }}</span>
            <span :class="['icon', showMore ? 'icon-chevron-up' : 'icon-chevron-down']"></span>
          </button>
          <template v-if="showMore">
            <a href="#" class="nav-link">
              <span class="icon icon-watch"></span>
              <span class="nav-text">Watch</span>
            </a>
            <a href="#" class="nav-link">
              <span class="icon icon-community"></span>
              <span class="nav-text">Community</span>
            </a>
            <a href="#" class="nav-link">
              <span class="icon icon-more"></span>
              <span class="nav-text">Other</span>
            </a>
          </template>
        </div>
      </div>
      <div class="nav-bottom">
        <a href="#" class="nav-link">
          <span class="icon icon-search"></span>
          <span class="nav-text">Search</span>
        </a>
        <a href="#" class="nav-link user-link">
          <div class="user-avatar"></div>
          <span class="nav-text">erik</span>
        </a>
      </div>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
      <div class="game-container">
        <div class="board-area">
          <!-- Eval Bar -->
          <div class="eval-bar">
            <div class="eval-black" :style="{ height: `${100 - evalPercent}%` }"></div>
            <div class="eval-white" :style="{ height: `${evalPercent}%` }">
              <span class="eval-score">{{ evalScore }}</span>
            </div>
          </div>

          <!-- Board with Players -->
          <div class="board-section">
            <!-- Opponent (Black) -->
            <div class="player-bar opponent">
              <div class="player-avatar black-avatar"></div>
              <div class="player-info">
                <div class="player-name">
                  <span class="username">Opponent</span>
                </div>
                <div class="captured-pieces">
                  <span class="advantage">+1</span>
                </div>
              </div>
              <div class="clock black-clock">
                <span>2:43</span>
              </div>
            </div>

            <!-- Chess Board -->
            <div class="chess-board">
              <img src="@/assets/chessboard.png" alt="Chess Board" />
            </div>

            <!-- Player (White) -->
            <div class="player-bar player">
              <div class="player-avatar white-avatar"></div>
              <div class="player-info">
                <div class="player-name">
                  <span class="username">Player</span>
                </div>
                <div class="captured-pieces">
                  <span class="advantage">+1</span>
                </div>
              </div>
              <div class="clock white-clock active">
                <span class="icon icon-clock"></span>
                <span>2:45</span>
              </div>
            </div>
          </div>

          <!-- Board Controls -->
          <div class="board-controls">
            <button class="control-btn" title="Settings">
              <span class="icon icon-settings"></span>
            </button>
            <button class="control-btn" title="Go back">
              <span class="icon icon-back"></span>
            </button>
            <button class="control-btn" title="Analysis">
              <span class="icon icon-search"></span>
            </button>
          </div>
        </div>

        <!-- Sidebar -->
        <aside class="sidebar">
          <div class="sidebar-header">
            <span class="sidebar-title">Play Coach</span>
            <button class="sound-btn">
              <span class="icon icon-sound"></span>
            </button>
          </div>

          <div class="sidebar-content">
            <!-- Coach Message -->
            <div class="coach-section">
              <div class="coach-avatar">
                <img src="https://images.chesscomfiles.com/uploads/v1/images_users/tiny_mce/SamCopeland/phpmeXx6V.png" alt="Coach Nadia" />
              </div>
              <div class="speech-bubble">
                <p>
                  Taking the 
                  <span class="keyword">open file</span> 
                  with your 
                  <span class="keyword">rook</span>.
                </p>
              </div>
            </div>

            <!-- Move List -->
            <div class="move-list-section">
              <div class="opening-name">
                <span>Réti Opening: Queenside Fianchetto Variation</span>
                <button class="explorer-btn">
                  <span class="icon icon-book"></span>
                </button>
              </div>
              <div class="moves">
                <div class="move-row">
                  <span class="move-num">1.</span>
                  <span class="move white">Nf3</span>
                  <span class="move black">b6</span>
                </div>
                <div class="move-row alt">
                  <span class="move-num">2.</span>
                  <span class="move white">c4</span>
                  <span class="move black">Bb7</span>
                </div>
                <div class="move-row">
                  <span class="move-num">3.</span>
                  <span class="move white">d4</span>
                  <span class="move black">Nf6</span>
                </div>
                <div class="move-row alt">
                  <span class="move-num">4.</span>
                  <span class="move white">g3</span>
                  <span class="move black">g6</span>
                </div>
                <div class="move-row">
                  <span class="move-num">5.</span>
                  <span class="move white">Bg2</span>
                  <span class="move black">Bg7</span>
                </div>
                <div class="move-row alt">
                  <span class="move-num">6.</span>
                  <span class="move white">O-O</span>
                  <span class="move black">O-O</span>
                </div>
                <div class="move-row">
                  <span class="move-num">7.</span>
                  <span class="move white">d5</span>
                  <span class="move black current">Na6</span>
                </div>
              </div>
            </div>
          </div>
        </aside>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const showMore = ref(true)
const evalPercent = ref(65)
const evalScore = ref('2.0')
</script>

<style scoped>
.play-coach-page {
  display: flex;
  min-height: 100vh;
  background: var(--color-bg-base, #312e2b);
  color: var(--color-text-primary, #fff);
}

/* Icons - CSS-based placeholders for local dev */
.icon {
  display: inline-flex;
  width: 20px;
  height: 20px;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.icon::before {
  font-size: 16px;
  line-height: 1;
}

.icon-play::before { content: '▶'; }
.icon-puzzle::before { content: '🧩'; font-size: 14px; }
.icon-learn::before { content: '📖'; font-size: 14px; }
.icon-train::before { content: '🎯'; font-size: 14px; }
.icon-watch::before { content: '👁'; font-size: 14px; }
.icon-community::before { content: '👥'; font-size: 14px; }
.icon-more::before { content: '•••'; font-size: 12px; letter-spacing: 2px; }
.icon-search::before { content: '🔍'; font-size: 14px; }
.icon-settings::before { content: '⚙'; }
.icon-back::before { content: '←'; }
.icon-clock::before { content: '⏱'; font-size: 14px; }
.icon-sound::before { content: '🔊'; font-size: 14px; }
.icon-book::before { content: '📚'; font-size: 14px; }
.icon-chevron-up::before { content: '▲'; font-size: 10px; }
.icon-chevron-down::before { content: '▼'; font-size: 10px; }

/* Navigation */
.nav-bar {
  width: 200px;
  min-width: 200px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: var(--space-12, 12px) var(--space-8, 8px);
  background: var(--color-bg-secondary, #262421);
}

.nav-top {
  display: flex;
  flex-direction: column;
  gap: var(--space-24, 24px);
}

.logo {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: var(--space-8, 8px) var(--space-12, 12px);
}

.logo-icon {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  background: #fff;
  position: relative;
}

.logo-icon::after {
  content: '';
  position: absolute;
  top: 4px;
  left: 4px;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background: var(--color-green-300, #769656);
}

.logo-text {
  font-family: 'Arial Black', 'Helvetica Bold', sans-serif;
  font-size: 18px;
  font-weight: 900;
  color: #fff;
  letter-spacing: -0.5px;
}

.nav-links {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.nav-link {
  display: flex;
  align-items: center;
  gap: var(--space-12, 12px);
  padding: var(--space-8, 8px) var(--space-12, 12px);
  border-radius: var(--radius-5, 5px);
  color: var(--color-text-secondary, hsla(0, 0%, 100%, 0.65));
  text-decoration: none;
  font-size: 15px;
  font-weight: 700;
  background: transparent;
  border: none;
  cursor: pointer;
  transition: all 0.15s ease;
  width: 100%;
  text-align: left;
}

.nav-link:hover {
  background: var(--color-bg-tertiary, hsla(0, 0%, 100%, 0.08));
  color: var(--color-text-primary, #fff);
}

.nav-link.active {
  background: var(--color-bg-tertiary, hsla(0, 0%, 100%, 0.12));
  color: var(--color-text-primary, #fff);
}

.nav-text {
  flex: 1;
}

.more-btn {
  justify-content: space-between;
}

.nav-bottom {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.user-link {
  gap: var(--space-8, 8px);
}

.user-avatar {
  width: 24px;
  height: 24px;
  border-radius: 3px;
  background: linear-gradient(135deg, #7fa650 0%, #5d8a3e 100%);
  flex-shrink: 0;
}

/* Main Content */
.main-content {
  flex: 1;
  padding: var(--space-16, 16px);
  overflow: auto;
}

.game-container {
  display: flex;
  gap: var(--space-16, 16px);
  max-width: 1200px;
  margin: 0 auto;
}

.board-area {
  display: flex;
  gap: var(--space-8, 8px);
}

/* Eval Bar */
.eval-bar {
  width: 24px;
  height: 576px;
  display: flex;
  flex-direction: column;
  border-radius: 3px;
  overflow: hidden;
}

.eval-black {
  background: var(--color-bg-base, #262421);
  transition: height 0.3s ease;
}

.eval-white {
  background: #ffffff;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  padding-top: var(--space-4, 4px);
  transition: height 0.3s ease;
}

.eval-score {
  font-size: 10px;
  font-weight: 700;
  color: var(--color-bg-base, #262421);
}

/* Board Section */
.board-section {
  display: flex;
  flex-direction: column;
  gap: var(--space-4, 4px);
}

.player-bar {
  display: flex;
  align-items: center;
  gap: var(--space-8, 8px);
  padding: var(--space-4, 4px) 0;
}

.player-avatar {
  width: 40px;
  height: 40px;
  border-radius: 3px;
}

.black-avatar {
  background: #262421;
}

.white-avatar {
  background: #ffffff;
}

.player-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.player-name {
  display: flex;
  align-items: center;
  gap: var(--space-4, 4px);
}

.player-name .username {
  font-size: 14px;
  font-weight: 700;
}

.captured-pieces {
  display: flex;
  align-items: center;
  gap: var(--space-4, 4px);
  font-size: 12px;
}

.advantage {
  color: var(--color-text-secondary, hsla(0, 0%, 100%, 0.72));
}

.clock {
  padding: var(--space-4, 4px) var(--space-8, 8px);
  border-radius: 4px;
  font-family: monospace;
  font-size: 18px;
  font-weight: 700;
  display: flex;
  align-items: center;
  gap: var(--space-4, 4px);
}

.black-clock {
  background: var(--color-bg-base, #262421);
  color: #ffffff;
  opacity: 0.5;
}

.white-clock {
  background: #ffffff;
  color: var(--color-bg-base, #262421);
}

.white-clock.active {
  opacity: 1;
}

.chess-board {
  width: 576px;
  height: 576px;
  border-radius: 3px;
  overflow: hidden;
}

.chess-board img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.board-controls {
  display: flex;
  gap: var(--space-8, 8px);
  margin-top: var(--space-8, 8px);
}

.control-btn {
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: transparent;
  border: none;
  border-radius: var(--radius-5, 5px);
  color: var(--color-text-secondary, hsla(0, 0%, 100%, 0.65));
  cursor: pointer;
  transition: all 0.15s ease;
}

.control-btn:hover {
  background: var(--color-bg-tertiary, hsla(0, 0%, 100%, 0.08));
  color: var(--color-text-primary, #fff);
}

/* Sidebar */
.sidebar {
  width: 340px;
  min-width: 340px;
  background: var(--color-bg-secondary, #262421);
  border-radius: var(--radius-5, 5px);
  display: flex;
  flex-direction: column;
}

.sidebar-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--space-12, 12px) var(--space-16, 16px);
  background: var(--color-bg-tertiary, #1e1c1a);
  border-radius: var(--radius-5, 5px) var(--radius-5, 5px) 0 0;
}

.sidebar-title {
  font-size: 17px;
  font-weight: 700;
}

.sound-btn {
  background: transparent;
  border: none;
  color: var(--color-text-secondary, hsla(0, 0%, 100%, 0.65));
  cursor: pointer;
  padding: var(--space-4, 4px);
  border-radius: var(--radius-5, 5px);
  transition: all 0.15s ease;
}

.sound-btn:hover {
  background: var(--color-bg-tertiary, hsla(0, 0%, 100%, 0.08));
  color: var(--color-text-primary, #fff);
}

.sidebar-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

/* Coach Section */
.coach-section {
  display: flex;
  gap: var(--space-12, 12px);
  padding: var(--space-16, 16px);
}

.coach-avatar {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  overflow: hidden;
  flex-shrink: 0;
}

.coach-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.speech-bubble {
  position: relative;
  background: #ffffff;
  border-radius: var(--radius-10, 10px);
  padding: var(--space-12, 12px) var(--space-16, 16px);
  color: var(--color-bg-base, #262421);
  font-size: 16px;
  line-height: 1.4;
}

.speech-bubble::before {
  content: '';
  position: absolute;
  left: -8px;
  top: 20px;
  width: 0;
  height: 0;
  border-top: 8px solid transparent;
  border-bottom: 8px solid transparent;
  border-right: 8px solid #ffffff;
}

.keyword {
  background: var(--color-green-100, rgba(129, 182, 76, 0.2));
  padding: 2px 6px;
  border-radius: 3px;
  box-shadow: inset 0 -2px 0 var(--color-green-200, rgba(129, 182, 76, 0.3));
}

/* Move List */
.move-list-section {
  flex: 1;
  display: flex;
  flex-direction: column;
  background: #ffffff;
  overflow: hidden;
}

.opening-name {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--space-8, 8px) var(--space-12, 12px);
  border-bottom: 1px solid #e0e0e0;
  font-size: 14px;
  color: #666;
}

.explorer-btn {
  background: transparent;
  border: none;
  color: #999;
  cursor: pointer;
  padding: var(--space-4, 4px);
}

.explorer-btn:hover {
  color: #666;
}

.moves {
  flex: 1;
  overflow-y: auto;
  color: var(--color-bg-base, #262421);
}

.move-row {
  display: grid;
  grid-template-columns: 32px 1fr 1fr;
  padding: var(--space-4, 4px) var(--space-12, 12px);
}

.move-row.alt {
  background: #f5f5f5;
}

.move-num {
  font-size: 12px;
  color: #999;
  font-weight: 600;
}

.move {
  font-size: 14px;
  font-weight: 600;
  padding: var(--space-4, 4px);
  border-radius: 3px;
  cursor: pointer;
}

.move:hover {
  background: #e0e0e0;
}

.move.current {
  background: var(--color-green-300, #81b64c);
  color: white;
}
</style>
