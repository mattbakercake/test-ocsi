<template>
    <!-- app bar -->
    <v-layout>
      <v-app-bar color="teal-darken-4" image="https://picsum.photos/1920/120?blur">

        <template v-slot:image>
          <v-img gradient="to top right, rgba(19,84,122,.8), rgba(128,208,199,.8)"></v-img>
        </template>

        <template v-slot:prepend>
          <v-app-bar-nav-icon></v-app-bar-nav-icon>
        </template>

        <v-app-bar-title>OCSI Test</v-app-bar-title>
      </v-app-bar>

      <!-- main content -->
      <v-main>
        <v-container fluid>
            <v-col>

            <!-- MessageDisplay component -->
            <v-row>
              <v-col>
                <MessageDisplay></MessageDisplay>
              </v-col>
            </v-row>

            <!-- TestGeometry component-->
            <v-row>
              <v-col>
                <TestGeometry></TestGeometry>
              </v-col>
            </v-row>

            </v-col>
        </v-container>
      </v-main>
      
    </v-layout>


</template>

<script setup>
import MessageDisplay from './components/MessageDisplay.vue'
import TestGeometry from './components/TestGeometry.vue'
</script>
