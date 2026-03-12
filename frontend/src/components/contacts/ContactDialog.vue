<template>
    <v-dialog :model-value="modelValue" @update:model-value="$emit('update:modelValue', $event)" max-width="500">
      <v-card>
        <v-card-title>{{ isEdit ? 'Edit Contact' : 'Add Contact' }}</v-card-title>
        <v-card-text>
          <v-form ref="formRef" v-model="valid">
            <v-text-field v-model="localContact.firstName" label="First Name" :rules="[rules.required]" />
            <v-text-field v-model="localContact.lastName" label="Last Name" :rules="[rules.required]" />
            <v-text-field v-model="localContact.designation" label="Designation" />
            <v-text-field v-model="localContact.email" label="Email" :rules="[rules.email]" />
            <v-text-field v-model="localContact.mobile" label="Mobile" />
            <v-select
              v-model="localContact.gender"
              :items="['Male', 'Female', 'Other']"
              label="Gender"
            />
            <v-text-field
              v-model="localContact.birthDate"
              label="Birth Date"
              type="date"
            />
            <v-switch v-model="localContact.isPrimary" label="Primary Contact" />
            <v-textarea v-model="localContact.notes" label="Notes" rows="2" />
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn color="grey" @click="cancel">Cancel</v-btn>
          <v-btn color="primary" @click="save" :loading="loading">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </template>
  
  <script setup lang="ts">
  import { ref, watch, computed } from 'vue'
  import type { Contact } from '@/types'
  
  const props = defineProps<{
    modelValue: boolean
    contact?: Contact | null
    loading?: boolean
  }>()
  
  const emit = defineEmits<{
    (e: 'update:modelValue', value: boolean): void
    (e: 'save', contact: Partial<Contact>): void
  }>()
  
  const rules = {
    required: (v: string) => !!v || 'Required',
    email: (v: string) => !v || /.+@.+\..+/.test(v) || 'Invalid email'
  }
  
  const formRef = ref()
  const valid = ref(false)
  const localContact = ref<Partial<Contact>>({
    firstName: '',
    lastName: '',
    designation: '',
    email: '',
    mobile: '',
    gender: '',
    birthDate: null,
    isPrimary: false,
    notes: ''
  })
  
  const isEdit = computed(() => !!props.contact?.id)
  
  watch(() => props.contact, (newVal) => {
    if (newVal) {
      localContact.value = { ...newVal }
    } else {
      // Reset to empty
      localContact.value = {
        firstName: '',
        lastName: '',
        designation: '',
        email: '',
        mobile: '',
        gender: '',
        birthDate: null,
        isPrimary: false,
        notes: ''
      }
    }
  }, { immediate: true })
  
  async function save() {
    const { valid } = await formRef.value.validate()
    if (!valid) return
    emit('save', localContact.value)
  }
  
  function cancel() {
    emit('update:modelValue', false)
  }
  </script>