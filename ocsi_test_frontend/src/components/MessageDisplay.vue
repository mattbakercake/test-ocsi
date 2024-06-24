<template>
    <v-card
    subtitle="Fetch a message from Laravel backend API"
    title="Message"
    >
    <v-card-text>
        <!-- button with progress indicator -->
        <v-btn @click="fetchMsg" :loading="msgLoading" color="teal-lighten-4">
        Go!
        <template v-slot:loader>
            <v-progress-linear indeterminate></v-progress-linear>
        </template>
        </v-btn>

        <!-- message -->
        <span class="ml-4 text-body-1 font-weight-black text-indigo-darken-4">{{ message }}</span>

        <!-- error alert-->
        <v-alert v-if="error" :title="`Error: ${error.status}`" :text="error.data.error" type="error" class="mt-2"></v-alert>

    </v-card-text>
    </v-card>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

axios.defaults.baseURL = 'http://127.0.0.1/backend/api';

let message = ref()         //data returned from backend
let msgLoading = ref(false) // waiting for backend (boolean)
let error = ref(false)      //error details if backend fails

//Call API to fetch a message
async function fetchMsg() {
    msgLoading.value = true
    const response = await axios.get('/message').catch((e) => error.value = e.response)

    if (!error.value) {
        message.value = response.data.message
    }
    
    msgLoading.value = false
}
</script>