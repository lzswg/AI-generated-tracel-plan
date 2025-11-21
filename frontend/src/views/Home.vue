<template>
  <div class="home-container">
    <div class="home-header">
      <div class="header-left">
        <el-icon class="logo-icon"><Suitcase /></el-icon>
        <span class="title">AI Travel Plan System</span>
      </div>
      <div class="header-right">
        <el-dropdown @command="handleCommand">
          <span class="user-info">
            <el-avatar :size="32" :src="userInfo.avatar || undefined">
              <el-icon><User /></el-icon>
            </el-avatar>
            <span class="nickname">{{ userInfo.nickname }}</span>
            <el-icon class="arrow-icon"><ArrowDown /></el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item disabled>
                <el-tag v-if="userInfo.role === 1" type="danger" size="small">Admin</el-tag>
                <el-tag v-else type="success" size="small">User</el-tag>
              </el-dropdown-item>
              <el-dropdown-item divided command="logout">
                <el-icon><SwitchButton /></el-icon>
                Logout
              </el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </div>

    <div class="home-content">
      <div class="welcome-card">
        <div class="welcome-text">
          <h1>Welcome to AI Travel Plan System 🎉</h1>
          <p>Login successful! More features are under development...</p>
          <el-divider />
          <div class="user-detail">
            <p><strong>Username:</strong> {{ userInfo.username }}</p>
            <p><strong>Nickname:</strong> {{ userInfo.nickname }}</p>
            <p><strong>Role:</strong>
              <el-tag v-if="userInfo.role === 1" type="danger">Admin</el-tag>
              <el-tag v-else type="success">User</el-tag>
            </p>
            <p><strong>Token:</strong> {{ token.substring(0, 50) }}...</p>
          </div>
        </div>
        <el-image
          class="welcome-image"
          src="https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=600"
          fit="cover"
        >
          <template #error>
            <div class="image-slot">
              <el-icon><Picture /></el-icon>
            </div>
          </template>
        </el-image>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'

const router = useRouter()
const userInfo = ref({})
const token = ref('')

onMounted(() => {
  const info = localStorage.getItem('userInfo')
  if (info) {
    userInfo.value = JSON.parse(info)
  }
  token.value = localStorage.getItem('token') || ''
})

const handleCommand = (command) => {
  if (command === 'logout') {
    ElMessageBox.confirm('Are you sure you want to logout?', 'Confirm', {
      confirmButtonText: 'Confirm',
      cancelButtonText: 'Cancel',
      type: 'warning'
    }).then(() => {
      localStorage.removeItem('token')
      localStorage.removeItem('userInfo')
      ElMessage.success('Logout successful')
      router.push('/login')
    }).catch(() => {})
  }
}
</script>

<style scoped>
.home-container {
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
}

.home-header {
  height: 60px;
  background: #fff;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 30px;
}

.header-left {
  display: flex;
  align-items: center;
}

.logo-icon {
  font-size: 28px;
  color: #409EFF;
  margin-right: 12px;
}

.title {
  font-size: 20px;
  font-weight: 600;
  color: #303133;
}

.user-info {
  display: flex;
  align-items: center;
  cursor: pointer;
  padding: 5px 15px;
  border-radius: 20px;
  transition: all 0.3s;
}

.user-info:hover {
  background: #f5f7fa;
}

.nickname {
  margin: 0 10px 0 12px;
  font-size: 14px;
  color: #606266;
}

.arrow-icon {
  font-size: 12px;
  color: #909399;
}

.home-content {
  padding: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: calc(100% - 60px);
}

.welcome-card {
  width: 100%;
  max-width: 1000px;
  background: #fff;
  border-radius: 20px;
  padding: 50px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
  display: flex;
  gap: 50px;
  align-items: center;
}

.welcome-text {
  flex: 1;
}

.welcome-text h1 {
  font-size: 32px;
  color: #303133;
  margin: 0 0 20px 0;
}

.welcome-text p {
  font-size: 16px;
  color: #606266;
  margin: 0;
}

.user-detail {
  margin-top: 20px;
}

.user-detail p {
  font-size: 14px;
  color: #606266;
  margin: 10px 0;
  line-height: 1.8;
}

.welcome-image {
  width: 350px;
  height: 350px;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.image-slot {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  background: #f5f7fa;
  color: #909399;
  font-size: 30px;
}

@media (max-width: 768px) {
  .welcome-card {
    flex-direction: column;
    padding: 30px;
  }

  .welcome-image {
    width: 100%;
    height: 250px;
  }
}
</style>

