<template>
    <div>
      <ContactTable
        :contacts="contactStore.contacts"
        :loading="contactStore.loading"
        @edit="openEditDialog"
        @delete="openDeleteDialog"
      />
  
      <!-- Add/Edit Dialog -->
      <ContactDialog
        v-model="dialog"
        :contact="editingContact"
        :loading="contactStore.loading"
        @save="handleSave"
      />
  
      <!-- Delete Confirmation Dialog (optional) -->
      <v-dialog v-model="deleteDialog" max-width="400">
        <v-card>
          <v-card-title>Confirm Delete</v-card-title>
          <v-card-text>
            Are you sure you want to delete {{ contactToDelete?.firstName }} {{ contactToDelete?.lastName }}?
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <v-btn color="grey" @click="deleteDialog = false">Cancel</v-btn>
            <v-btn color="error" @click="confirmDelete" :loading="contactStore.loading">Delete</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref, watch } from 'vue'
  import { useContactStore } from '@/stores/contactStore'
  import type { Contact } from '@/types'
  import ContactTable from './ContactTable.vue'
  import ContactDialog from './ContactDialog.vue'
  
  const props = defineProps<{
    clientId: number
  }>()
  
  const emit = defineEmits<{
    (e: 'show-message', message: string, color?: string): void
  }>()
  
  const contactStore = useContactStore()
  
  // Dialog state
  const dialog = ref(false)
  const editingContact = ref<Contact | null>(null)
  const deleteDialog = ref(false)
  const contactToDelete = ref<Contact | null>(null)
  
  // Fetch contacts when clientId changes
  watch(() => props.clientId, async (newId) => {
    if (newId) {
      await contactStore.fetchContactsByClient(newId)
    } else {
      contactStore.contacts = []
    }
  }, { immediate: true })
  
  function openAddDialog() {
    editingContact.value = null
    dialog.value = true
  }
  
  function openEditDialog(contact: Contact) {
    editingContact.value = contact
    dialog.value = true
  }
  
  async function handleSave(contactData: Partial<Contact>) {
    try {
      if (editingContact.value?.id) {
        // Update
        await contactStore.updateContact(props.clientId, editingContact.value.id, contactData)
        emit('show-message', 'Contact updated successfully')
      } else {
        // Create
        await contactStore.createContact(props.clientId, contactData)
        emit('show-message', 'Contact created successfully')
      }
      dialog.value = false
    } catch (err) {
      emit('show-message', `Failed to save contact`, 'error')
    }
  }
  
  function openDeleteDialog(contact: Contact) {
    contactToDelete.value = contact
    deleteDialog.value = true
  }
  
  async function confirmDelete() {
    if (!contactToDelete.value) return
    try {
      await contactStore.deleteContact(props.clientId, contactToDelete.value.id)
      emit('show-message', 'Contact deleted successfully')
      deleteDialog.value = false
    } catch (err) {
      emit('show-message', 'Failed to delete contact', 'error')
    }
  }
  
  // Expose openAddDialog to parent (so the "Add Contact" button can trigger it)
  defineExpose({
    openAddDialog
  })
  </script>