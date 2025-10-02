<script lang="ts">
  import { onMount } from 'svelte';
  
  let isLoading = true;
  let loadingProgress = 0;
  
  onMount(() => {
    // Simulate loading progress
    const interval = setInterval(() => {
      loadingProgress += Math.random() * 30;
      if (loadingProgress >= 100) {
        loadingProgress = 100;
        setTimeout(() => {
          isLoading = false;
        }, 500);
        clearInterval(interval);
      }
    }, 200);
    
    return () => clearInterval(interval);
  });
</script>

{#if isLoading}
  <!-- Loading Screen -->
  <div class="fixed inset-0 z-50 bg-gradient-to-br from-indigo-900 via-purple-900 to-pink-900 flex items-center justify-center">
    <div class="text-center">
      <!-- Logo Animation -->
      <div class="mb-8 animate-pulse">
        <div class="w-24 h-24 mx-auto bg-white/20 rounded-full flex items-center justify-center">
          <svg class="w-12 h-12 text-white animate-spin" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
          </svg>
        </div>
      </div>
      
      <!-- Brand Name -->
      <h1 class="text-3xl font-bold text-white mb-4">Glam Stitch</h1>
      
      <!-- Progress Bar -->
      <div class="w-64 mx-auto bg-white/20 rounded-full h-2 mb-4">
        <div 
          class="bg-gradient-to-r from-indigo-400 to-purple-400 h-2 rounded-full transition-all duration-300"
          style="width: {loadingProgress}%"
        ></div>
      </div>
      
      <!-- Loading Text -->
      <p class="text-white/80 text-sm">Memuat konten... {Math.round(loadingProgress)}%</p>
    </div>
  </div>
{/if}

<style>
  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }
</style>
