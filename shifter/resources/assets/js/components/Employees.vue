<template>
  <div class="panel panel-default">
    <div class="panel-heading">Employees
        <a href="#" class="btn pull-right btn-xs btn-primary"><span class="glyphicon glyphicon-align-justify"></span></a>
    </div>
    <div class="panel-body">
      {{ list }}
    </div>
  </div>
</template>

<script>
export default {
        data() {
          return {
            list: 'Hello Pagekit!'
          }
        }
      }
</script>

<style lang="css">
</style>
