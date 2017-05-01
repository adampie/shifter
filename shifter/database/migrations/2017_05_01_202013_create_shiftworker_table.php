<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShiftworkerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shiftworkers', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('employees_id')->unsigned();
            $table->integer('company_id')->unsigned();
            $table->timestamps();
            $table->foreign('employees_id')->references('id')->on('employees');
            $table->foreign('company_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
          Schema::dropIfExists('shiftworkers');
    }
}
