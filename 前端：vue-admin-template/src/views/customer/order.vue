<template>
  <div class="app-container">
      <h1>餐厅菜单展示</h1>
         <el-table
      :data="dishes"
      style="width: 100%">
      <el-table-column
      label="序号"
      width="100">
      <template slot-scope="scope">
        {{scope.$index+1}}
      </template>
    </el-table-column>
      <el-table-column
        prop="id"
        label="菜单号"
        width="100">
      </el-table-column>
      <el-table-column
        prop="name"
        label="菜名"
        width="100">
      </el-table-column>
      <el-table-column
        prop="price"
        label="价格"
        width="100">
      </el-table-column>
      <el-table-column
        prop="information"
        label="信息"
         width="100">
      </el-table-column>
       <el-table-column
        prop="isfinished"
        label="菜个数"
         width="100">
    </el-table-column>
      <el-table-column>
           <el-input-number v-model="number" @change="countDish" :min="0" :max="100" ></el-input-number>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { showDishes} from '@/api/customer'
export default {
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'gray',
        deleted: 'danger'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      dishes:{
      },
      number:0
    };
  },
  created() {
    this.getDish()
  },
  methods: {
    getDish() {
     showDishes().then(response => {
       this.dishes=response.data.items
      })
    },
    countDish(value){
             console.log(value);
    }
  }
}
</script>
