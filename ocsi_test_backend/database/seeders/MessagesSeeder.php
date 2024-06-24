<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MessagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('messages')->insert([
            'message' => 'Hello World',
        ]);
        DB::table('messages')->insert([
            'message' => 'Bom Dia',
        ]);
        DB::table('messages')->insert([
            'message' => 'Buen día',
        ]);
        DB::table('messages')->insert([
            'message' => 'Bonne journée',
        ]);
        DB::table('messages')->insert([
            'message' => 'Guten Tag',
        ]);
    }
}
