<template>
   <v-card
    subtitle="Identify invalid geometry in dataset"
    title="Invalid Geometry"
    >

    <v-card-text>
        <!-- button with progress indicator-->
        <v-btn @click="fetchInvalid" :loading="geoLoading" color="teal-lighten-4">
        Go!
        <template v-slot:loader>
            <v-progress-linear indeterminate></v-progress-linear>
        </template>
        </v-btn>

        <!-- results table -->
        <v-table v-if="geometries">
            <thead>
                <tr>
                    <th class="text-left">
                    id
                    </th>
                    <th class="text-left">
                    Area Name
                    </th>
                    <th class="text-left">
                    Reason
                    </th>
                    <th class="text-left">
                    Location
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr
                    v-for="item in geometries"
                    :key="item.id"
                >
                    <td>{{ item.id }}</td>
                    <td>{{ item.area_name }}</td>
                    <td>{{ item.reason }}</td>
                    <td>{{ item.location }}</td>
                </tr>
            </tbody>
        </v-table>

        <!-- error alert-->
        <v-alert v-if="error" :title="`Error: ${error.status}`" :text="error.data.error" type="error" class="mt-2"></v-alert>

    </v-card-text>
    </v-card> 
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

axios.defaults.baseURL = 'http://127.0.0.1/backend/api';

let geometries = ref()      //data returned from backend 
let geoLoading = ref(false) //waiting for backend (boolean)
let error = ref(false)      //error details if backend fails

//Call API to fetch any invalid data
async function fetchInvalid() {
    geoLoading.value = true
    const response = await axios.get('/invalid_geo').catch((e) => error.value = e.response)

    if (!error.value) {
        geometries.value = response.data
    }

    geoLoading.value = false
}
</script>