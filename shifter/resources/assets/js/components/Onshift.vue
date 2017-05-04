<template>
  <div class="panel panel-default">
      <div class="panel-heading">On Shift
        <a href="#" class="btn pull-right btn-xs btn-primary"><span class="glyphicon glyphicon-plus"></span></a>
      </div>
        <div
      <div class="panel-body">
      </div>
  </div>
</div>
</template>

<script>
export default {
        data() {
          return {
            shiftworkers: [],
          }
        },

         mounted() {
           this.readShiftWorkers()
         },

        methods: {
          createShiftWorkers () {
            axios.post('/api/v1/shiftworker/adam/pie');
          },
          readShiftWorkers () {
            axios.get('/api/v1/shiftworker').then( response => {
              if(response.data.length != 0){
                this.shiftworkers = response.data
              }
            });
          },
          updateShiftWorkers () {
            axios.post('/api/v1/shiftworker/1/a/p');
          },
          deleteShiftWorkers () {
            axios.post('/api/v1/shiftworker/1');
          }
        }
      }
</script>

<style lang="css">
</style>
