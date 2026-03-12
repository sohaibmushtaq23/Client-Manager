<template>
  <v-container fluid>
    <v-row>
      <!-- Left column: client list -->
      <v-col cols="6">
        <ClientList
          :clients="store.clients"
          :selected-client-id="store.selectedClient?.id"
          :loading="store.loading"
          :error="store.error"
          @select="store.selectClient"
          @add="openAddDialog"
          @delete="openDeleteDialog(store.selectedClient!)"
        />
      </v-col>

      <!-- Right column: client details -->
      <v-col cols="6">
        <ClientDetails
          :client="store.selectedClient"
          @show-message="showNotification"
        />
      </v-col>
    </v-row>

    <!-- Client Delete Dialog -->
    <v-dialog v-model="deleteDialog.show" max-width="400">
      <v-card>
        <v-card-title>Confirm Delete</v-card-title>
        <v-card-text>
          Are you sure you want to delete {{ deleteDialog.clientName }}?
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn color="grey" @click="deleteDialog.show = false">Cancel</v-btn>
          <v-btn color="error" @click="confirmDelete" :loading="store.loading">Delete</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Add Client Dialog -->
    <v-dialog v-model="addDialog" max-width="600">
      <v-card>
        <v-card-title>Add New Client</v-card-title>
        <v-card-text>
          <v-form ref="addFormRef" v-model="addValid">
            <v-text-field v-model="newClient.clientCode" label="Client Code" :rules="[rules.required]" />
            <v-text-field v-model="newClient.companyName" label="Company Name" :rules="[rules.required]" />
            <v-text-field v-model="newClient.industry" label="Industry" />
            <v-text-field v-model="newClient.email" label="Email" :rules="[rules.email]" />
            <v-text-field v-model="newClient.phone" label="Phone" />
            <v-text-field v-model="newClient.website" label="Website" />
            <v-text-field v-model="newClient.country" label="Country" />
            <v-text-field v-model="newClient.city" label="City" />
            <v-text-field v-model="newClient.address" label="Address" />
            <v-switch v-model="newClient.isActive" label="Active" />
            <v-text-field v-model.number="newClient.creditLimit" label="Credit Limit" type="number" />
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn color="grey" @click="addDialog = false">Cancel</v-btn>
          <v-btn color="primary" @click="saveNewClient" :loading="store.loading">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Global Snackbar -->
    <v-snackbar v-model="snackbar.show" :color="snackbar.color" timeout="3000">
      {{ snackbar.message }}
      <template v-slot:actions>
        <v-btn color="white" variant="text" @click="snackbar.show = false">Close</v-btn>
      </template>
    </v-snackbar>
  </v-container>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useClientStore } from '@/stores/clientStore'
import type { Client } from '@/types'
import ClientList from '@/components/clients/ClientList.vue'
import ClientDetails from '@/components/clients/ClientDetails.vue'

const store = useClientStore()

// Add client dialog
const addDialog = ref(false)
const addFormRef = ref()
const addValid = ref(false)
const newClient = ref<Omit<Client, 'id' | 'createdAt'>>({
  clientCode: '',
  companyName: '',
  industry: '',
  email: '',
  phone: '',
  website: '',
  country: '',
  city: '',
  address: '',
  isActive: true,
  creditLimit: 0
})

// Delete dialog
const deleteDialog = ref({
  show: false,
  clientId: 0,
  clientName: ''
})

// Snackbar
const snackbar = ref({
  show: false,
  message: '',
  color: 'success'
})

// Validation rules (shared with add dialog)
const rules = {
  required: (v: string) => !!v || 'Required',
  email: (v: string) => !v || /.+@.+\..+/.test(v) || 'Invalid email'
}

function showNotification(message: string, color = 'success') {
  snackbar.value = { show: true, message, color }
}

// Add client
function openAddDialog() {
  newClient.value = {
    clientCode: '',
    companyName: '',
    industry: '',
    email: '',
    phone: '',
    website: '',
    country: '',
    city: '',
    address: '',
    isActive: true,
    creditLimit: 0
  }
  addDialog.value = true
}

async function saveNewClient() {
  const { valid } = await addFormRef.value.validate()
  if (!valid) return

  try {
    await store.createClient(newClient.value)
    addDialog.value = false
    showNotification('Client created successfully')
  } catch (err) {
    showNotification('Failed to create client', 'error')
  }
}

// Delete client
function openDeleteDialog(client: Client) {
  deleteDialog.value = { show: true, clientId: client.id, clientName: client.companyName }
}

async function confirmDelete() {
  try {
    await store.deleteClient(deleteDialog.value.clientId)
    deleteDialog.value.show = false
    showNotification('Client deleted successfully')
  } catch (err) {
    showNotification('Failed to delete client', 'error')
  }
}

// Initial fetch
store.fetchClients()
</script>