import SwiftUI
import CoreMotion
import CoreLocation
import Charts

struct ContentView: View {
    @StateObject private var motionManager = MotionDataManager()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Accelerometer X-Axis").font(.title2).fontWeight(.bold).foregroundColor(.red)
                        Chart {
                            ForEach(motionManager.accelerometerData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("X", motionManager.accelerometerData[index].x))
                                    .foregroundStyle(.red)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Accelerometer Y-Axis").font(.title2).fontWeight(.bold).foregroundColor(.green)
                        Chart {
                            ForEach(motionManager.accelerometerData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("Y", motionManager.accelerometerData[index].y))
                                    .foregroundStyle(.green)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.square)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Accelerometer Z-Axis").font(.title2).fontWeight(.bold).foregroundColor(.blue)
                        Chart {
                            ForEach(motionManager.accelerometerData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("Z", motionManager.accelerometerData[index].z))
                                    .foregroundStyle(.blue)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.triangle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }

                    // Gyroscope Graph
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Gyroscope Y Data").font(.title2).fontWeight(.bold)
                        Chart {
                            ForEach(motionManager.gyroscopeYData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("Gyro Y", motionManager.gyroscopeYData[index]))
                                    .foregroundStyle(.purple)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -5...5)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        HStack { Label("Gyro Y", systemImage: "circle.fill").foregroundColor(.purple) }.font(.caption)
                    }

                    // Magnetometer Graph (X-axis example)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Magnetometer X-Axis").font(.title2).fontWeight(.bold).foregroundColor(.orange)
                        Chart {
                            ForEach(motionManager.magnetometerData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("X", motionManager.magnetometerData[index].magneticField.x))
                                    .foregroundStyle(.orange)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -100...100)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }

                    // Gravity Graph (X-axis example)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Gravity X-Axis").font(.title2).fontWeight(.bold).foregroundColor(.yellow)
                        Chart {
                            ForEach(motionManager.gravityData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("X", motionManager.gravityData[index].field.x))
                                    .foregroundStyle(.yellow)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -1...1)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }

                    // Linear Acceleration Graph (X-axis example)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Linear Accel X-Axis").font(.title2).fontWeight(.bold).foregroundColor(.cyan)
                        Chart {
                            ForEach(motionManager.linearAccelerationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("X", motionManager.linearAccelerationData[index].x))
                                    .foregroundStyle(.cyan)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }

                    // Rotation Matrix Graphs
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M11").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M11", motionManager.rotationData[index].m11))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M12").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M12", motionManager.rotationData[index].m12))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M13").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M13", motionManager.rotationData[index].m13))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M21").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M21", motionManager.rotationData[index].m21))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M22").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M22", motionManager.rotationData[index].m22))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M23").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M23", motionManager.rotationData[index].m23))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M31").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M31", motionManager.rotationData[index].m31))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M32").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M32", motionManager.rotationData[index].m32))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Rotation M33").font(.title2).fontWeight(.bold).foregroundColor(.indigo)
                        Chart {
                            ForEach(motionManager.rotationData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("M33", motionManager.rotationData[index].m33))
                                    .foregroundStyle(.indigo)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: -2...2)
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }

                    // Pressure Graph
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Barometer Pressure").font(.title2).fontWeight(.bold).foregroundColor(.pink)
                        Chart {
                            ForEach(motionManager.pressureData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("Pressure", motionManager.pressureData[index]))
                                    .foregroundStyle(.pink)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: 90000...110000) // Typical pressure range in Pascals
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }

                    // Pedometer Steps
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Pedometer Steps").font(.title2).fontWeight(.bold).foregroundColor(.teal)
                        Chart {
                            ForEach(motionManager.pedometerData.indices, id: \.self) { index in
                                LineMark(x: .value("Time", index), y: .value("Steps", motionManager.pedometerData[index].numberOfSteps.doubleValue))
                                    .foregroundStyle(.teal)
                                    .lineStyle(StrokeStyle(lineWidth: 3))
                                    .symbol(.circle)
                                    .symbolSize(20)
                            }
                        }
                        .frame(height: 200)
                        .chartYScale(domain: 0...1000) // Adjust based on expected step count
                        .chartXScale(domain: 0...100)
                        .chartYAxis { AxisMarks(position: .leading) { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .chartXAxis { AxisMarks { AxisGridLine(); AxisTick(); AxisValueLabel() } }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }

                    // Current Values Display
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Current Values").font(.title2).fontWeight(.bold)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Accelerometer").font(.headline)
                                Text("X: \(motionManager.currentAccelerometer.x, specifier: "%.3f")").foregroundColor(.red)
                                Text("Y: \(motionManager.currentAccelerometer.y, specifier: "%.3f")").foregroundColor(.green)
                                Text("Z: \(motionManager.currentAccelerometer.z, specifier: "%.3f")").foregroundColor(.blue)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Gyroscope").font(.headline)
                                Text("Y: \(motionManager.currentGyroscopeY, specifier: "%.3f")").foregroundColor(.purple)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Magnetometer").font(.headline)
                                Text("X: \(motionManager.magnetometerData.last?.magneticField.x ?? 0, specifier: "%.3f")").foregroundColor(.orange)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }

                    HStack {
                        Button(action: {
                            if motionManager.isRunning {
                                motionManager.stopMotionUpdates()
                            } else {
                                motionManager.startMotionUpdates()
                            }
                        }) {
                            Text(motionManager.isRunning ? "Stop" : "Start")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(motionManager.isRunning ? Color.red : Color.green)
                                .cornerRadius(10)
                        }
                        Button(action: {
                            motionManager.clearData()
                        }) {
                            Text("Clear")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                        Button(action: {
                            motionManager.saveAndShareData()
                        }) {
                            Text("Share")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Motion Graphs")
            .onAppear {
                motionManager.startMotionUpdates()
            }
            .onDisappear {
                motionManager.stopMotionUpdates()
            }
        }
    }
}

struct AccelerometerData {
    let x: Double
    let y: Double
    let z: Double
}

class MotionDataManager: ObservableObject {
    private let motionManager = CMMotionManager()
    private let altimeter = CMAltimeter()
    private let pedometer = CMPedometer()
    private let maxDataPoints = 100

    @Published var accelerometerData: [AccelerometerData] = []
    @Published var gyroscopeYData: [Double] = []
    @Published var magnetometerData: [CMMagnetometerData] = []
    @Published var gravityData: [CMCalibratedMagneticField] = []
    @Published var linearAccelerationData: [CMAcceleration] = []
    @Published var rotationData: [CMRotationMatrix] = []
    @Published var pressureData: [Double] = []
    @Published var pedometerData: [CMPedometerData] = []
    @Published var currentAccelerometer = AccelerometerData(x: 0, y: 0, z: 0)
    @Published var currentGyroscopeY: Double = 0
    @Published var isRunning = false

    init() {
        setupMotionManager()
    }

    private func setupMotionManager() {
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.gyroUpdateInterval = 0.1
        motionManager.magnetometerUpdateInterval = 0.1
        motionManager.deviceMotionUpdateInterval = 0.1
    }

    func startMotionUpdates() {
        guard !isRunning else { return }
        isRunning = true

        // Accelerometer
        if motionManager.isAccelerometerAvailable {
            motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, error in
                guard let self = self, let data = data else { return }
                let newData = AccelerometerData(x: data.acceleration.x, y: data.acceleration.y, z: data.acceleration.z)
                DispatchQueue.main.async {
                    self.currentAccelerometer = newData
                    self.accelerometerData.append(newData)
                    if self.accelerometerData.count > self.maxDataPoints {
                        self.accelerometerData.removeFirst()
                    }
                }
            }
        }

        // Gyroscope
        if motionManager.isGyroAvailable {
            motionManager.startGyroUpdates(to: .main) { [weak self] data, error in
                guard let self = self, let data = data else { return }
                DispatchQueue.main.async {
                    self.currentGyroscopeY = data.rotationRate.y
                    self.gyroscopeYData.append(data.rotationRate.y)
                    if self.gyroscopeYData.count > self.maxDataPoints {
                        self.gyroscopeYData.removeFirst()
                    }
                }
            }
        }

        // Magnetometer
        if motionManager.isMagnetometerAvailable {
            motionManager.startMagnetometerUpdates(to: .main) { [weak self] data, error in
                guard let self = self, let data = data else { return }
                DispatchQueue.main.async {
                    self.magnetometerData.append(data)
                    if self.magnetometerData.count > self.maxDataPoints {
                        self.magnetometerData.removeFirst()
                    }
                }
            }
        }

        // Device Motion (Gravity, Linear Acceleration, Rotation)
        if motionManager.isDeviceMotionAvailable {
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
                guard let self = self, let data = data else { return }
                DispatchQueue.main.async {
                    self.gravityData.append(data.magneticField)
                    self.linearAccelerationData.append(data.userAcceleration)
                    self.rotationData.append(data.attitude.rotationMatrix)
                    if self.gravityData.count > self.maxDataPoints {
                        self.gravityData.removeFirst()
                        self.linearAccelerationData.removeFirst()
                        self.rotationData.removeFirst()
                    }
                }
            }
        }

        // Barometer
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: .main) { [weak self] data, error in
                guard let self = self, let pressure = data?.pressure else { return }
                DispatchQueue.main.async {
                    self.pressureData.append(pressure.doubleValue)
                    if self.pressureData.count > self.maxDataPoints {
                        self.pressureData.removeFirst()
                    }
                }
            }
        }

        // Pedometer
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { [weak self] data, error in
                guard let self = self, let data = data else { return }
                DispatchQueue.main.async {
                    self.pedometerData.append(data)
                    if self.pedometerData.count > self.maxDataPoints {
                        self.pedometerData.removeFirst()
                    }
                }
            }
        }
    }

    func stopMotionUpdates() {
        isRunning = false
        motionManager.stopAccelerometerUpdates()
        motionManager.stopGyroUpdates()
        motionManager.stopMagnetometerUpdates()
        motionManager.stopDeviceMotionUpdates()
        altimeter.stopRelativeAltitudeUpdates()
        pedometer.stopUpdates()
    }

    func clearData() {
        accelerometerData.removeAll()
        gyroscopeYData.removeAll()
        magnetometerData.removeAll()
        gravityData.removeAll()
        linearAccelerationData.removeAll()
        rotationData.removeAll()
        pressureData.removeAll()
        pedometerData.removeAll()
        currentAccelerometer = AccelerometerData(x: 0, y: 0, z: 0)
        currentGyroscopeY = 0
    }

    func saveAndShareData() {
        let allData = [
            "accelerometer": accelerometerData.map { ["x": $0.x, "y": $0.y, "z": $0.z] },
            "gyroscopeY": gyroscopeYData,
            "magnetometer": magnetometerData.map { ["x": $0.magneticField.x, "y": $0.magneticField.y, "z": $0.magneticField.z] },
            "gravity": gravityData.map { ["x": $0.field.x, "y": $0.field.y, "z": $0.field.z] },
            "linearAcceleration": linearAccelerationData.map { ["x": $0.x, "y": $0.y, "z": $0.z] },
            "rotation": rotationData.map { ["m11": $0.m11, "m12": $0.m12, "m13": $0.m13, "m21": $0.m21, "m22": $0.m22, "m23": $0.m23, "m31": $0.m31, "m32": $0.m32, "m33": $0.m33] },
            "pressure": pressureData,
            "pedometer": pedometerData.map { ["steps": $0.numberOfSteps.doubleValue, "distance": $0.distance?.doubleValue ?? 0] }
        ] as [String : Any]
        let jsonData = try? JSONSerialization.data(withJSONObject: allData, options: .prettyPrinted)
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("motion_data.json")
        try? jsonData?.write(to: fileURL)
        
        let activityController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true)
    }
}
