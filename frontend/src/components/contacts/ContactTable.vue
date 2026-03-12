<template>
    <v-data-table
      :headers="headers"
      :items="contacts"
      :loading="loading"
      class="elevation-1"
    >
      <template v-slot:item.actions="{ item }">
        <v-icon small class="mr-2" @click="$emit('edit', item)">mdi-pencil</v-icon>
        <v-icon small @click="$emit('delete', item)">mdi-delete</v-icon>
      </template>
    </v-data-table>
  </template>
  
  <script setup lang="ts">
  import type { Contact } from '@/types'
  
  defineProps<{
    contacts: Contact[]
    loading: boolean
  }>()
  
  defineEmits<{
    (e: 'edit', contact: Contact): void
    (e: 'delete', contact: Contact): void
  }>()
  
  const headers = [
    { title: 'First Name', value: 'firstName' },
    { title: 'Last Name', value: 'lastName' },
    { title: 'Email', value: 'email' },
    { title: 'Mobile', value: 'mobile' },
    { title: 'Primary', value: 'isPrimary' },
    { title: 'Actions', value: 'actions', sortable: false }
  ]
  </script>