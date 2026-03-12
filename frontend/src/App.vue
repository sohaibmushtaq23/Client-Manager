<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <v-app-bar-title>Client Manager</v-app-bar-title>
    </v-app-bar>

    <v-main>
      <v-container fluid>
        <router-view />
      </v-container>
    </v-main>
  </v-app>
</template>

<script setup lang="ts">
// No script needed for now
</script>