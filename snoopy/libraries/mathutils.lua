--!strict

-- by setmetatable24 (https://github.com/setmetatable24). Use it for free, open source math library from 16 years old dev!
--NAVIGATION:
--  QUATERNIONS & ROTATION
--    matrixToQuaternion, quaternionToCFrame, quaternionMultiply, quaternionSlerp, angleAxisToQuaternion,
--    quaternionToAngleAxis, quaternionDot, quaternionNormalize, quaternionConjugate, quaternionInverse,
--    quaternionFromTo, quaternionIntegrateAngularVelocity, quaternionToMatrix, rotateVector, quaternionLookAt
--  CFRAME & CAMERA
--    createCFrameInterpolator, createSplineInterpolator, orthonormalizeCFrame, lookRotation,
--    cameraYawPitchFromCFrame, cameraClampYawPitch, cameraOrbitCFrame, cameraSmoothCFrame, cameraFollowCFrame,
--    cameraFitAABB, cameraShakeFromTrauma, cameraResolveObstruction, cameraBoomCollisionCFrame, cameraOverShoulderCFrame,
--    cameraScreenShakeOffset, cameraRayDirectionFromViewportUnit, cameraClampPitch, cameraNormalizeYaw
--  VECTORS 3D
--    vector3Abs, vector3Sign, vector3Floor, vector3Ceil, vector3Round, vector3Min, vector3Max, vector3Hadamard,
--    vector3Reciprocal, vector3Clamp, vector3ClampMagnitude, vector3MoveTowards, vector3Project, vector3Reject,
--    vector3Reflect, vector3Slide, vector3Damp, vector3DeadZone, vector3SnapToGrid, vector3RotateAroundAxis,
--    vector3RotateAroundPoint, vector3AngleBetween, vector3SignedAngleAroundAxis, vector3Orthogonal,
--    vector3BuildBasisRight, vector3BuildBasisUp, vector3ProjectOnPlane, vector3MirrorAcrossPlane
--  VECTORS 2D
--    vector2Abs, vector2Sign, vector2Floor, vector2Ceil, vector2Round, vector2Clamp, vector2ClampMagnitude,
--    vector2MoveTowards, vector2Perpendicular, vector2Cross, vector2Rotate, vector2FromAngle, vector2Angle,
--    vector2Project, vector2Reject, vector2Reflect, vector2Slide, vector2Damp, vector2DeadZone, vector2RotateAround
--  INTERPOLATION & EASING
--    lerp, inverseLerp, smoothstep, smootherstep, hermite, catmullRom, bezier, quadraticBezier, cubicBezier,
--    easeIn2..easeInOut5, elasticIn, elasticOut, bounceOut, bounceIn, backIn, backOut, springDamp,
--    criticallyDampedSpring, smoothDamp, scalarMoveTowards, scalarDamp, vectorSmoothDamp, exponentialSmooth,
--    scalarPingPong, scalarPingPong01, scalarBias, scalarGain, scalarLogistic, scalarSoftplus, scalarBell01,
--    scalarParabola01, scalarSmoothPulse, remap, pingPong, repeatValue, deltaAngle, moveTowards, moveTowardsAngle
--  COLLISION & GEOMETRY 3D
--    collisionAABBContainsPoint, collisionSphereContainsPoint, collisionCapsuleContainsPoint, collisionRayPlaneTime,
--    collisionSphereAABBDistance, collisionPointTriangleBarycentric, collisionSphereSphere, collisionSphereAABB,
--    collisionSphereOBB, collisionCapsuleSphere, collisionCapsuleCapsule, collisionRayAABBInterval,
--    collisionRaySphereDetailed, collisionSegmentSphere, collisionSegmentAABB, collisionSweptSpherePlane,
--    collisionSweptSphereSphere, collisionResolveSphereAABB, collisionResolveSphereOBB, collisionClipVelocity,
--    collisionSlideVelocity, collisionGroundSnap, pointInTriangle, closestPointOnTriangle, rayTriangleIntersection,
--    rayAABBIntersection, rayOBBIntersection, sphereAABBOverlap, sphereOBBOverlap, capsuleCapsuleDistance,
--    sweptSphereSphereTime, rayCapsuleIntersection, segmentSphereIntersection, segmentCapsuleIntersection,
--    closestPointOnRay, closestPointsRaySegment, pointInFrustum, sphereInFrustum, aabbInFrustum, obbInFrustum,
--    obbOBBOverlap, gjkSupport, gjkDoSimplex, gjkCollision, epaPenetration, quickHull3D, delaunayTriangulation,
--    sutherlandHodgmanClip, signedDistanceSphere, signedDistancePlane, signedDistanceAABB, signedDistanceOBB,
--    signedDistanceCapsule, signedDistanceCylinder, sdfUnion, sdfIntersection, sdfSubtraction, sdfSmoothUnion,
--    sdfSmoothIntersection, sdfSmoothSubtraction, sphereTrace, triangleNormal, triangleTangentBasis,
--    barycentricCoordinates, pointPlaneDistance, projectPointOnPlane, rayPlaneIntersection, reflectVector,
--    refractVector, frustumFromCamera, normalFromSDF, normalizePlane, sphereInPlane, orthonormalBasisFromNormal,
--    tangentFrame, closestPointsOnSegments, closestPointsOnSegmentsDetailed, distanceSquaredSegments,
--    closestPointOnSegment, closestPointOnAABB, pointInAABB, closestPointOnOBB, pointInOBB, raySphereIntersection,
--    aabbOverlap, aabbIntersectionDepth, expandAABB, mergeAABB, transformAABB, boundingSphereFromAABB,
--    aabbSurfaceArea, aabbVolume, projectPointsOnAxis, intervalsOverlap, projectAABBOnAxis, projectOBBOnAxis,
--    signedTetrahedronVolume, triangleArea, morton3D, inertiaTensorSolidSphere, inertiaTensorBox,
--    inertiaTensorSolidCylinder, orientation2D, planeFromPointNormal, planeFromTriangle, distancePointPlane
--  COLLISION & GEOMETRY 2D
--    gridWorldToCell2D, gridCellToWorld2D, gridManhattan2D, gridChebyshev2D, gridNeighbor4, gridNeighbor8,
--    pathSmoothCorner, pathSegmentLength, pathSampleLinear, pathClosestPointPolyline, pathSimplifyCollinear,
--    pointInTriangle2D, segmentSegmentIntersection2D, polygonArea2D, pointInPolygon2D, polygonCentroid2D,
--    polygonPerimeter2D, circleBoundingBox, intersectRayAABB2D, distPointToSegment2D, distPointToLine2D,
--    reflectPointAcrossLine2D, rotatePoint2D, scalePoint2D, translatePoint2D, barycentricCoordinates2D,
--    isPointInTriangle2D, triangleArea2D, minEnclosingCircle2D, quadraticBezier2D, cubicBezier2D,
--    cubicBezierLengthApprox, catmullRom2D, straightSkeleton2D, spatialHash2D, kNearestNeighbors2D, convexHull2D,
--    delaunayTriangulation2D, boxPacking2D
--  MATRICES & LINEAR ALGEBRA
--    mat3Identity, mat3FromCFrame, mat3Determinant, mat3Transpose, mat3MulVec, mat3Mul, mat3Inverse,
--    matrixMultiply, matrixAdd, matrixSubtract, matrixTranspose, matrixIdentity, matrixTrace, matrixFrobeniusNorm,
--    matrixSolve3x3, choleskyDecompose3x3, luDecompose3x3, solveLinearSystem3x3, solveLinearSystemLU,
--    conjugateGradient, linearLeastSquares, qrDecompositionHouseholder, matrixMultiply3x3, matrixTranspose3x3,
--    matrixDeterminant3x3, matrixInverse3x3, solveLinear, solveQuadratic, solveCubic, solveQuadraticStable,
--    evaluatePolynomial, evaluatePolynomialDerivative, newtonRaphson, jacobiEigenvalues3x3, covarianceMatrix,
--    pca2D, principalComponentProjection
--  PATHFINDING & GRAPHS
--    topologicalSort, stronglyConnectedComponents, dijkstra, minimumSpanningTree, breadthFirstSearch,
--    depthFirstSearch, gridHeuristicOctile, gridHeuristicEuclidean, gridHeuristicDiagonal3D, gridCellCenterAABB
--  DATA STRUCTURES
--    createBVH, bvhRaycast, createOctree, octreeRangeQuery, createKDTree, kdTreeNearestNeighbor, kNearestNeighbors,
--    rangeQuery, createQuadtree, quadtreeInsert, quadtreeSubdivide, quadtreeQuery, createHeap, createTrie,
--    trieInsert, trieSearch, trieStartsWith, trieCollect, trieAutocomplete, createLRUCache, lruGet, lruPut,
--    createBloomFilter, bloomAdd, bloomMaybeContains, bitsetNew, bitsetSet, bitsetClear
--  COMPILER / CFG / AST / ANALYSIS
--    controlFlowGraphMetrics, scopeNestingDepth, symbolTableHashCount, astNodeCount, tokenFrequency,
--    sourceCodeEntropy, basicBlockCoverage, instructionPerBasicBlock, liveVariableAnalysis, dominatorTree,
--    createDFA, dfaAddState, dfaSetTransition, dfaSimulate, createNFA, nfaAddState, nfaAddTransition,
--    nfaEpsilonClosure, nfaSimulate, regexToNFA, shuntingYard, evaluatePostfix
--  HASHING & BITWISE
--    hashInt32, hashCoords2, hashCoords3, hashToUnit01, fnv1aHash32, djb2Hash, sdbmHash, popcount32, bitReverse32,
--    isPowerOfTwo, nextPowerOfTwo, previousPowerOfTwo, alignUp, alignDown, quantizeUnorm, dequantizeUnorm,
--    quantizeSnorm, dequantizeSnorm
--  STRINGS & TEXT
--    levenshteinDistance, hammingDistance, longestCommonSubsequence, knuthMorrisPrattPatternSearch, rabinKarpSearch,
--    jaroSimilarity, jaroWinklerDistance, wrapText, expandTabs, lineColumnToOffset, offsetToLineColumn,
--    countLeadingWhitespace, linesToOffsets, numberToBase, baseToNumber, formatWithCommas, formatBytes, formatDuration
--  SORTING & SEARCHING
--    quickSort, mergeSort, heapSort, binarySearch, interpolationSearch, setUnionSorted, setIntersectionSorted,
--    setDifferenceSorted
--  STATISTICS & PROBABILITY
--    statisticsMean, statisticsVariance, statisticsCovariance, statisticsPercentile, statisticsKurtosis, mean,
--    median, variance, standardDeviation, factorial, binomialCoefficient, permutations, combinations, gammaFunction,
--    betaFunction, erf, normalPDF, normalCDF, poissonPDF, exponentialPDF, uniformPDF, fibonacci, fibonacciSequence,
--    isPrime, primeSieve, gcd, lcm, modularInverse, modularExponentiation, chineseRemainderTheorem, riemannZetaApprox,
--    harmonicNumber, stirlingApproximation, logFactorial, pascalTriangleRow
--  SIGNAL & FILTERS
--    butterworthLowpass2ndOrder, bandpassFilter, notchFilter, movingAverageFilter, medianFilter, kalmanFilter1D,
--    kalmanFilter
--  COLOR
--    colorMathLerp, colorMathScale, colorMathAdd, colorMathMultiply, colorMathLuminance, colorMathContrastText,
--    linearToGamma, gammaToLinear, colorLerp, colorToHSV, hsvToColor, lerpColor, colorDistance, perceivedBrightness,
--    isDarkColor, complementaryColor, rgbToHsl, hslToRgb, rgbToHsv, hsvToRgb
--  NUMERICAL METHODS
--    simpsonRule, trapezoidalRule, bisectionMethod, goldenSectionSearch, gradientDescent1D, simulatedAnnealing,
--    hermiteInterpolation, lagrangeInterpolation, newtonDividedDifference, lissajousCurve, spiralPoint,
--    heartCurve, superellipsePoint
--  NEURAL / ML BASICS
--    sigmoid, sigmoidDerivative, relu, reluDerivative, tanh, softmax, crossEntropyLoss, meanSquaredError,
--    kMeansClustering, dotProduct, vectorMagnitude, vectorNormalize, vectorAdd, vectorSubtract, vectorScale
--  NOISE & RANDOM
--    noise01, noiseSigned, fbmNoise3D, noiseVector3, noiseVector2, valueNoise1, valueNoise2, valueNoise3,
--    fbm2, fbm3, randomUnitVector2, randomUnitVector3, randomPointInSphere, randomPointInCircle, randomNormal,
--    randomExponential, randomUniformOnDisk, randomUniformOnSphere, randomUnitVector, randomRotation, randomVector,
--    seededRandom, seededRandomRange, shuffleArray, sampleWithoutReplacement
--  UTILITIES
--    clamp, saturate, snap, wrap, safeUnit, clampMagnitude, approximately, isFinite, safeDivide,
--    projectPointOnLine, distanceToLine, gaussian, fresnelIn, fresnelOut, fresnelInOut, min3, max3, midpoint,
--    fract, step, safeAcos, safeAsin, sinc, lerpPrecise, bilerp, trilerp, intervalAdd, intervalSubtract,
--    intervalMultiply, intervalUnion, intervalIntersect, intervalContains, intervalOverlap, arrayAverageVector3,
--    arrayAverageNumber, arrayMinNumber, arrayMaxNumber, arrayBoundsVector3, arrayWeightedAverageVector3,
--    arrayWeightedAverageNumber, applyLinearDrag, applyQuadraticDrag, solveBallisticArc, aabbFromPoints,
--    mergeAABB, transformAABB, boundingSphereFromAABB, polygonSelfIntersection, segmentsIntersect, isInside,
--    intersection, sutherlandHodgmanClip, scalarClamp01, scalarClampSigned, scalarSquare, scalarCube,
--    scalarQuartic, scalarSignedSquare, scalarSafeDivide, scalarSafeSqrt, scalarSafeLog, scalarSafeAcos,
--    scalarSafeAsin, scalarWrap01, scalarWrap, scalarDeadZone,
--    scalarNormalizeDeadZone, scalarQuantize, scalarRoundTo, scalarApproximately, scalarBetween, scalarInverseSafe,
--    scalarRcp, scalarRcpSqrtSafe, scalarNormalizeDegrees, scalarShortestDeltaDegrees, scalarLerpAngleDegrees,
--    scalarDampAngleDegrees, scalarMedian3

local MathUtils = {}

type Plane = { normal: Vector3, d: number }
type Contact = { depth: number? }

local EPSILON = 1e-7
local HALF_PI = math.pi / 2
local TWO_PI = math.pi * 2
local DEG_TO_RAD = math.pi / 180
local RAD_TO_DEG = 180 / math.pi

MathUtils.EPSILON = EPSILON
MathUtils.HALF_PI = HALF_PI
MathUtils.PI = math.pi
MathUtils.TWO_PI = TWO_PI
MathUtils.DEG_TO_RAD = DEG_TO_RAD
MathUtils.RAD_TO_DEG = RAD_TO_DEG
MathUtils.FLOAT_MAX = math.huge
MathUtils.FLOAT_MIN = 2.2250738585072014e-308

local function invSqrt(x: number): number
	if x <= 0 then
		return 0
	end
	return 1 / math.sqrt(x)
end

local function cubeRoot(x: number): number
	if x < 0 then
		return -((-x) ^ (1 / 3))
	end
	return x ^ (1 / 3)
end

function MathUtils.matrixToQuaternion(cf: CFrame): (number, number, number, number)
	local right = cf.RightVector
	local up = cf.UpVector
	local back = -cf.LookVector
	local m00, m01, m02 = right.X, up.X, back.X
	local m10, m11, m12 = right.Y, up.Y, back.Y
	local m20, m21, m22 = right.Z, up.Z, back.Z
	local trace = m00 + m11 + m22
	local qw = 0
	local qx = 0
	local qy = 0
	local qz = 0

	if trace > 0 then
		local s = 0.5 / math.sqrt(math.max(0, trace + 1))
		qw = 0.25 / s
		qx = (m21 - m12) * s
		qy = (m02 - m20) * s
		qz = (m10 - m01) * s
	elseif m00 > m11 and m00 > m22 then
		local s = 2 * math.sqrt(math.max(0, 1 + m00 - m11 - m22))
		qw = (m21 - m12) / s
		qx = 0.25 * s
		qy = (m01 + m10) / s
		qz = (m02 + m20) / s
	elseif m11 > m22 then
		local s = 2 * math.sqrt(math.max(0, 1 + m11 - m00 - m22))
		qw = (m02 - m20) / s
		qx = (m01 + m10) / s
		qy = 0.25 * s
		qz = (m12 + m21) / s
	else
		local s = 2 * math.sqrt(math.max(0, 1 + m22 - m00 - m11))
		qw = (m10 - m01) / s
		qx = (m02 + m20) / s
		qy = (m12 + m21) / s
		qz = 0.25 * s
	end

	return qx, qy, qz, qw
end

function MathUtils.quaternionToCFrame(
	px: number, py: number, pz: number,
	qx: number, qy: number, qz: number, qw: number
): CFrame
	local xx, yy, zz = qx * qx, qy * qy, qz * qz
	local xy, xz, xw = qx * qy, qx * qz, qx * qw
	local yz, yw, zw = qy * qz, qy * qw, qz * qw

	return CFrame.new(
		px, py, pz,
		1 - 2 * (yy + zz),
		2 * (xy - zw),
		2 * (xz + yw),
		2 * (xy + zw),
		1 - 2 * (xx + zz),
		2 * (yz - xw),
		2 * (xz - yw),
		2 * (yz + xw),
		1 - 2 * (xx + yy)
	)
end

function MathUtils.quaternionMultiply(
	qx1: number, qy1: number, qz1: number, qw1: number,
	qx2: number, qy2: number, qz2: number, qw2: number
): (number, number, number, number)
	local x = qw1 * qx2 + qx1 * qw2 + qy1 * qz2 - qz1 * qy2
	local y = qw1 * qy2 - qx1 * qz2 + qy1 * qw2 + qz1 * qx2
	local z = qw1 * qz2 + qx1 * qy2 - qy1 * qx2 + qz1 * qw2
	local w = qw1 * qw2 - qx1 * qx2 - qy1 * qy2 - qz1 * qz2
	return x, y, z, w
end

function MathUtils.quaternionSlerp(
	qx1: number, qy1: number, qz1: number, qw1: number,
	qx2: number, qy2: number, qz2: number, qw2: number,
	t: number
): (number, number, number, number)
	local dot = qx1 * qx2 + qy1 * qy2 + qz1 * qz2 + qw1 * qw2
	if dot < 0 then
		qx2, qy2, qz2, qw2 = -qx2, -qy2, -qz2, -qw2
		dot = -dot
	end
	dot = math.min(dot, 1.0)

	if dot > 0.9995 then
		local x = qx1 + t * (qx2 - qx1)
		local y = qy1 + t * (qy2 - qy1)
		local z = qz1 + t * (qz2 - qz1)
		local w = qw1 + t * (qw2 - qw1)
		local norm = invSqrt(x * x + y * y + z * z + w * w)
		return x * norm, y * norm, z * norm, w * norm
	end

	local theta0 = math.acos(dot)
	local sinTheta0 = math.sin(theta0)
	if math.abs(sinTheta0) < EPSILON then
		local x = qx1 + t * (qx2 - qx1)
		local y = qy1 + t * (qy2 - qy1)
		local z = qz1 + t * (qz2 - qz1)
		local w = qw1 + t * (qw2 - qw1)
		local norm = invSqrt(x * x + y * y + z * z + w * w)
		return x * norm, y * norm, z * norm, w * norm
	end
	local theta = theta0 * t
	local sinTheta = math.sin(theta)
	local s0 = math.cos(theta) - dot * sinTheta / sinTheta0
	local s1 = sinTheta / sinTheta0

	return s0 * qx1 + s1 * qx2, s0 * qy1 + s1 * qy2, s0 * qz1 + s1 * qz2, s0 * qw1 + s1 * qw2
end

function MathUtils.angleAxisToQuaternion(
	angle: number,
	ax: number, ay: number, az: number
): (number, number, number, number)
	local magSq = ax * ax + ay * ay + az * az

	if magSq < EPSILON then
		return 0, 0, 0, 1
	end

	local halfAngle = angle * 0.5
	local s, c = math.sin(halfAngle), math.cos(halfAngle)
	local scale = s / math.sqrt(magSq)

	local x = ax * scale
	local y = ay * scale
	local z = az * scale
	return x, y, z, c
end

function MathUtils.quaternionToAngleAxis(
	qx: number, qy: number, qz: number, qw: number
): (number, number, number, number)
	local angle = 2 * math.acos(math.min(1, math.max(-1, qw)))
	local sinHalf = math.sqrt(1 - qw * qw)

	if sinHalf < EPSILON then
		return 0, 1, 0, 0
	end

	local scale = 1 / sinHalf
	return angle, qx * scale, qy * scale, qz * scale
end

function MathUtils.rotateVector(
	vx: number, vy: number, vz: number,
	qx: number, qy: number, qz: number, qw: number
): (number, number, number)
	local tx = 2 * (qy * vz - qz * vy)
	local ty = 2 * (qz * vx - qx * vz)
	local tz = 2 * (qx * vy - qy * vx)
	local rx = vx + qw * tx + (qy * tz - qz * ty)
	local ry = vy + qw * ty + (qz * tx - qx * tz)
	local rz = vz + qw * tz + (qx * ty - qy * tx)
	return rx, ry, rz
end

function MathUtils.quaternionLookAt(
	dirX: number, dirY: number, dirZ: number,
	upX: number, upY: number, upZ: number
): (number, number, number, number)
	local dirLenSq = dirX * dirX + dirY * dirY + dirZ * dirZ

	if dirLenSq < EPSILON then
		return 0, 0, 0, 1
	end

	local invDirLen = invSqrt(dirLenSq)
	local fwdX, fwdY, fwdZ = dirX * invDirLen, dirY * invDirLen, dirZ * invDirLen

	local upLenSq = upX * upX + upY * upY + upZ * upZ
	if upLenSq < EPSILON then
		upX, upY, upZ = 0, 1, 0
	else
		local invUpLen = invSqrt(upLenSq)
		upX, upY, upZ = upX * invUpLen, upY * invUpLen, upZ * invUpLen
	end

	local rightX = fwdY * upZ - fwdZ * upY
	local rightY = fwdZ * upX - fwdX * upZ
	local rightZ = fwdX * upY - fwdY * upX

	local rightLenSq = rightX * rightX + rightY * rightY + rightZ * rightZ
	if rightLenSq < EPSILON then
		return 0, 0, 0, 1
	end

	local invRightLen = invSqrt(rightLenSq)
	rightX, rightY, rightZ = rightX * invRightLen, rightY * invRightLen, rightZ * invRightLen

	local uX = rightY * fwdZ - rightZ * fwdY
	local uY = rightZ * fwdX - rightX * fwdZ
	local uZ = rightX * fwdY - rightY * fwdX

	local trace = rightX + uY + fwdZ + 1

	if trace > EPSILON then
		local s = 0.5 / math.sqrt(trace)
		local qx = (uZ - fwdY) * s
		local qy = (fwdX - rightZ) * s
		local qz = (rightY - uX) * s
		local qw = 0.25 / s
		return qx, qy, qz, qw
	elseif rightX > uY and rightX > fwdZ then
		local s = 2 * math.sqrt(1 + rightX - uY - fwdZ)
		local qx = 0.25 * s
		local qy = (rightY + uX) / s
		local qz = (rightZ + fwdX) / s
		local qw = (uZ - fwdY) / s
		return qx, qy, qz, qw
	elseif uY > fwdZ then
		local s = 2 * math.sqrt(1 + uY - rightX - fwdZ)
		local qx = (rightY + uX) / s
		local qy = 0.25 * s
		local qz = (uZ + fwdY) / s
		local qw = (fwdX - rightZ) / s
		return qx, qy, qz, qw
	else
		local s = 2 * math.sqrt(1 + fwdZ - rightX - uY)
		local qx = (rightZ + fwdX) / s
		local qy = (uZ + fwdY) / s
		local qz = 0.25 * s
		local qw = (rightY - uX) / s
		return qx, qy, qz, qw
	end
end

function MathUtils.createCFrameInterpolator(from: CFrame, to: CFrame): (t: number) -> CFrame
	local px1, py1, pz1 = from.Position.X, from.Position.Y, from.Position.Z
	local px2, py2, pz2 = to.Position.X, to.Position.Y, to.Position.Z
	local qx1, qy1, qz1, qw1 = MathUtils.matrixToQuaternion(from)
	local qx2, qy2, qz2, qw2 = MathUtils.matrixToQuaternion(to)

	local dx, dy, dz = px2 - px1, py2 - py1, pz2 - pz1
	local dot = qx1 * qx2 + qy1 * qy2 + qz1 * qz2 + qw1 * qw2
	local useSlerp = math.abs(dot) <= 0.99995

	if useSlerp then
		return function(t: number): CFrame
			t = t > 1 and 1 or t < 0 and 0 or t
			local x, y, z, w = MathUtils.quaternionSlerp(
				qx1, qy1, qz1, qw1,
				qx2, qy2, qz2, qw2,
				t
			)
			local cf = MathUtils.quaternionToCFrame(
				px1 + t * dx, py1 + t * dy, pz1 + t * dz,
				x, y, z, w
			)
			return cf
		end
	else
		return function(t: number): CFrame
			t = t > 1 and 1 or t < 0 and 0 or t
			return CFrame.new(px1 + t * dx, py1 + t * dy, pz1 + t * dz):Lerp(to, t)
		end
	end
end

function MathUtils.createSplineInterpolator(
	points: { CFrame },
	times: { number }?
): (t: number) -> CFrame
	local n = #points
	if n < 2 then
		local single = points[1] or CFrame.new()
		return function(t: number): CFrame
			return single
		end
	end

	local segments = {}
	for i = 1, n - 1 do
		local p0 = points[i]
		local p1 = points[i + 1]
		local t0 = (times and times[i]) or (i - 1) / (n - 1)
		local t1 = (times and times[i + 1]) or i / (n - 1)

		local interp = MathUtils.createCFrameInterpolator(p0, p1)
		segments[i] = {
			start = t0,
			finish = t1,
			interp = interp
		}
	end

	local lastIdx = 1
	return function(t: number): CFrame
		t = t > 1 and 1 or t < 0 and 0 or t
		for i = lastIdx, #segments do
			local seg = segments[i]
			if t <= seg.finish or i == #segments then
				lastIdx = i
				local segT = (t - seg.start) / math.max(seg.finish - seg.start, EPSILON)
				segT = segT < 0 and 0 or segT > 1 and 1 or segT
				return seg.interp(segT)
			end
		end
		return points[n]
	end
end

function MathUtils.exponentialSmooth(
	current: number,
	target: number,
	smoothness: number,
	dt: number
): number
	local alpha = 1 - math.exp(-math.max(smoothness, 0) * math.max(dt, 0))
	return current + (target - current) * alpha
end

function MathUtils.springDamp(
	current: number,
	target: number,
	velocity: number,
	stiffness: number,
	damping: number,
	dt: number
): (number, number)
	local safeDt = math.max(dt, 0)
	local safeStiffness = math.max(stiffness, 0)
	local safeDamping = math.max(damping, 0)
	if safeDt <= 0 then
		return current, velocity
	end
	if safeStiffness <= EPSILON then
		local decay = math.exp(-safeDamping * safeDt)
		local newVelocity = velocity * decay
		return current + newVelocity * safeDt, newVelocity
	end
	local omega = math.sqrt(safeStiffness)
	local zeta = safeDamping / (2 * omega)
	local x = current - target
	if math.abs(zeta - 1) <= 0.0001 then
		return MathUtils.criticallyDampedSpring(current, target, velocity, omega, safeDt)
	elseif zeta < 1 then
		local dampedOmega = omega * math.sqrt(math.max(1 - zeta * zeta, EPSILON))
		local expTerm = math.exp(-zeta * omega * safeDt)
		local cosTerm = math.cos(dampedOmega * safeDt)
		local sinTerm = math.sin(dampedOmega * safeDt)
		local b = (velocity + zeta * omega * x) / dampedOmega
		local newX = expTerm * (x * cosTerm + b * sinTerm)
		local newVelocity = expTerm * ((b * dampedOmega - zeta * omega * x) * cosTerm + (-x * dampedOmega - zeta * omega * b) * sinTerm)
		return target + newX, newVelocity
	else
		local root = math.sqrt(zeta * zeta - 1)
		local r1 = -omega * (zeta - root)
		local r2 = -omega * (zeta + root)
		local c1 = (velocity - r2 * x) / math.max(r1 - r2, EPSILON)
		local c2 = x - c1
		local e1 = math.exp(r1 * safeDt)
		local e2 = math.exp(r2 * safeDt)
		local newX = c1 * e1 + c2 * e2
		local newVelocity = c1 * r1 * e1 + c2 * r2 * e2
		return target + newX, newVelocity
	end
end
	function MathUtils.fnv1a32(str: string): number
		local hash = 2166136261
		for i = 1, #str do
			hash = bit32.bxor(hash, string.byte(str, i))
			hash = bit32.band(hash * 16777619, 0xFFFFFFFF)
		end
		return hash
	end

	function MathUtils.murmur3_32(str: string, seed: number?): number
		local h = seed or 0
		local len = #str
		local c1, c2 = 0xcc9e2d51, 0x1b873593
		local i = 1
		while i + 3 <= len do
			local k = string.byte(str,i) + string.byte(str,i+1)*256 + string.byte(str,i+2)*65536 + string.byte(str,i+3)*16777216
			k = bit32.band(k * c1, 0xFFFFFFFF)
			k = bit32.bor(bit32.lshift(k,15), bit32.rshift(k,17))
			k = bit32.band(k * c2, 0xFFFFFFFF)
			h = bit32.bxor(h, k)
			h = bit32.bor(bit32.lshift(h,13), bit32.rshift(h,19))
			h = bit32.band(h * 5 + 0xe6546b64, 0xFFFFFFFF)
			i += 4
		end
		local k = 0
		local rem = len - i + 1
		if rem >= 3 then k = bit32.bor(k, bit32.lshift(string.byte(str,i+2),16)) end
		if rem >= 2 then k = bit32.bor(k, bit32.lshift(string.byte(str,i+1),8)) end
		if rem >= 1 then
			k = bit32.bor(k, string.byte(str,i))
			k = bit32.band(k * c1, 0xFFFFFFFF)
			k = bit32.bor(bit32.lshift(k,15), bit32.rshift(k,17))
			k = bit32.band(k * c2, 0xFFFFFFFF)
			h = bit32.bxor(h, k)
		end
		h = bit32.bxor(h, len)
		h = bit32.bxor(h, bit32.rshift(h,16))
		h = bit32.band(h * 0x85ebca6b, 0xFFFFFFFF)
		h = bit32.bxor(h, bit32.rshift(h,13))
		h = bit32.band(h * 0xc2b2ae35, 0xFFFFFFFF)
		h = bit32.bxor(h, bit32.rshift(h,16))
		return h
	end

	function MathUtils.popcount(n: number): number
		n = bit32.band(n, 0xFFFFFFFF)
		n = n - bit32.band(bit32.rshift(n,1), 0x55555555)
		n = bit32.band(n,0x33333333) + bit32.band(bit32.rshift(n,2),0x33333333)
		n = bit32.band(n + bit32.rshift(n,4), 0x0f0f0f0f)
		return bit32.band(bit32.rshift(n * 0x01010101, 24), 0xFF)
	end

	function MathUtils.clz32(n: number): number
		if n == 0 then return 32 end
		local count = 0
		if bit32.band(n,0xFFFF0000)==0 then count+=16; n=bit32.lshift(n,16) end
		if bit32.band(n,0xFF000000)==0 then count+=8;  n=bit32.lshift(n,8)  end
		if bit32.band(n,0xF0000000)==0 then count+=4;  n=bit32.lshift(n,4)  end
		if bit32.band(n,0xC0000000)==0 then count+=2;  n=bit32.lshift(n,2)  end
		if bit32.band(n,0x80000000)==0 then count+=1 end
		return count
	end

	function MathUtils.nextPow2(n: number): number
		if n <= 1 then return 1 end
		n -= 1
		n = bit32.bor(n, bit32.rshift(n,1))
		n = bit32.bor(n, bit32.rshift(n,2))
		n = bit32.bor(n, bit32.rshift(n,4))
		n = bit32.bor(n, bit32.rshift(n,8))
		n = bit32.bor(n, bit32.rshift(n,16))
		return n + 1
	end

	export type Bitset = { words: {number}, size: number }

function MathUtils.bitsetNew(size: number, existing: {number}?): Bitset
	local words = existing or {}
	local needed = math.ceil(size/32)
	for i = 1, needed do words[i] = 0 end
	for i = needed + 1, #words do words[i] = nil end
	return { words=words, size=size }
end

	function MathUtils.bitsetSet(bs: Bitset, i: number)
		local w = math.ceil(i/32)
		bs.words[w] = bit32.bor(bs.words[w], bit32.lshift(1,(i-1)%32))
	end

	function MathUtils.bitsetClear(bs: Bitset, i: number)
		local w = math.ceil(i/32)
		bs.words[w] = bit32.band(bs.words[w], bit32.bnot(bit32.lshift(1,(i-1)%32)))
	end

	function MathUtils.bitsetGet(bs: Bitset, i: number): boolean
		local w = math.ceil(i/32)
		return bit32.band(bs.words[w] or 0, bit32.lshift(1,(i-1)%32)) ~= 0
	end

	function MathUtils.bitsetUnion(a: Bitset, b: Bitset): Bitset
		local r = MathUtils.bitsetNew(math.max(a.size, b.size))
		for i = 1, #r.words do r.words[i] = bit32.bor(a.words[i] or 0, b.words[i] or 0) end
		return r
	end

	function MathUtils.bitsetIntersect(a: Bitset, b: Bitset): Bitset
		local r = MathUtils.bitsetNew(math.min(a.size, b.size))
		for i = 1, #r.words do r.words[i] = bit32.band(a.words[i] or 0, b.words[i] or 0) end
		return r
	end

	function MathUtils.bitsetEqual(a: Bitset, b: Bitset): boolean
		local n = math.max(#a.words, #b.words)
		for i = 1, n do
			if (a.words[i] or 0) ~= (b.words[i] or 0) then return false end
		end
		return true
	end

	function MathUtils.bitsetIterate(bs: Bitset): () -> number?
		local i = 0
		return function(): number?
			i += 1
			while i <= bs.size do
				if MathUtils.bitsetGet(bs, i) then
					return i
				end
				i += 1
			end
			return nil
		end
	end

	export type NFAState = { id: number, transitions: {[string]: {number}}, epsilon: {number}, accepting: boolean }
	export type NFA = { states: {NFAState}, start: number, stateCount: number }
	export type DFAState = { id: number, transitions: {[string]: number}, accepting: boolean, nfaSet: {number} }
	export type DFA = { states: {DFAState}, start: number }

	function MathUtils.nfaNew(): NFA
		return { states={}, start=1, stateCount=0 }
	end

	function MathUtils.nfaAddEpsilon(nfa: NFA, from: number, to: number)
		table.insert(nfa.states[from].epsilon, to)
	end

	local function epsilonClosure(nfa: NFA, stateSet: {number}): {number}
		local closure: {[number]: boolean} = {}
		local stack: {number} = {}
		for _, s in ipairs(stateSet) do closure[s]=true; table.insert(stack,s) end
		while #stack > 0 do
			local s = table.remove(stack) :: number
			for _, t in ipairs(nfa.states[s].epsilon) do
				if not closure[t] then closure[t]=true; table.insert(stack,t) end
			end
		end
		local result: {number} = {}
		for s in pairs(closure) do table.insert(result, s) end
		table.sort(result)
		return result
	end

	local function moveNFA(nfa: NFA, stateSet: {number}, symbol: string): {number}
		local reached: {[number]: boolean} = {}
		for _, s in ipairs(stateSet) do
			local trans = nfa.states[s].transitions[symbol]
			if trans then for _, t in ipairs(trans) do reached[t]=true end end
		end
		local result: {number} = {}
		for s in pairs(reached) do table.insert(result, s) end
		return result
	end

	local function nfaSetKey(set: {number}): string return table.concat(set, ",") end

	local function nfaIsAccepting(nfa: NFA, set: {number}): boolean
		for _, s in ipairs(set) do if nfa.states[s].accepting then return true end end
		return false
	end

	function MathUtils.nfaToDFA(nfa: NFA, alphabet: {string}): DFA
		local dfa: DFA = { states={}, start=1 }
		local setToId: {[string]: number} = {}
		local queue: {{number}} = {}
		local stateId = 0
		local startSet = epsilonClosure(nfa, {nfa.start})
		stateId += 1
		setToId[nfaSetKey(startSet)] = stateId
		dfa.states[stateId] = { id=stateId, transitions={}, accepting=nfaIsAccepting(nfa,startSet), nfaSet=startSet }
		table.insert(queue, startSet)
		while #queue > 0 do
			local current = table.remove(queue, 1) :: {number}
			local currentId = setToId[nfaSetKey(current)]
			for _, sym in ipairs(alphabet) do
				local moved = moveNFA(nfa, current, sym)
				if #moved > 0 then
					local closure = epsilonClosure(nfa, moved)
					local key = nfaSetKey(closure)
					if not setToId[key] then
						stateId += 1
						setToId[key] = stateId
						dfa.states[stateId] = { id=stateId, transitions={}, accepting=nfaIsAccepting(nfa,closure), nfaSet=closure }
						table.insert(queue, closure)
					end
					dfa.states[currentId].transitions[sym] = setToId[key]
				end
			end
		end
		return dfa
	end

	function MathUtils.dfaMinimize(dfa: DFA, alphabet: {string}): DFA
		local accepting: {number} = {}
		local nonAccepting: {number} = {}
		for i, st in ipairs(dfa.states) do
			if st.accepting then table.insert(accepting,i) else table.insert(nonAccepting,i) end
		end
		local partition: {{number}} = {}
		if #accepting > 0 then table.insert(partition, accepting) end
		if #nonAccepting > 0 then table.insert(partition, nonAccepting) end
		local stateToGroup: {number} = {}
		local function rebuildMap()
			for g, group in ipairs(partition) do
				for _, s in ipairs(group) do stateToGroup[s] = g end
			end
		end
		rebuildMap()
		local changed = true
		while changed do
			changed = false
			local newPartition: {{number}} = {}
			for _, group in ipairs(partition) do
				if #group <= 1 then table.insert(newPartition, group); continue end
				local splits: {[string]: {number}} = {}
				for _, s in ipairs(group) do
					local sig = ""
					for _, sym in ipairs(alphabet) do
						local t = dfa.states[s].transitions[sym]
						sig ..= sym .. "=" .. (t and tostring(stateToGroup[t]) or "X") .. ";"
					end
					if not splits[sig] then splits[sig] = {} end
					table.insert(splits[sig], s)
				end
				local parts: {{number}} = {}
				for _, p in pairs(splits) do table.insert(parts, p) end
				if #parts > 1 then changed = true end
				for _, p in ipairs(parts) do table.insert(newPartition, p) end
			end
			partition = newPartition
			rebuildMap()
		end
		local minDFA: DFA = { states={}, start=1 }
		for g, group in ipairs(partition) do
			local rep = dfa.states[group[1]]
			local newTrans: {[string]: number} = {}
			for _, sym in ipairs(alphabet) do
				local t = rep.transitions[sym]
				if t then newTrans[sym] = stateToGroup[t] end
			end
			minDFA.states[g] = { id=g, transitions=newTrans, accepting=rep.accepting, nfaSet={} }
		end
		minDFA.start = stateToGroup[dfa.start]
		return minDFA
	end

	function MathUtils.dfaMatch(dfa: DFA, input: string): boolean
		local current = dfa.start
		for i = 1, #input do
			local sym = string.sub(input, i, i)
			local st = dfa.states[current]
			if not st then return false end
			local nxt = st.transitions[sym]
			if not nxt then return false end
			current = nxt
		end
		local st = dfa.states[current]
		return st ~= nil and st.accepting
	end

	function MathUtils.dfaRun(dfa: DFA, input: string): (boolean, number)
		local current = dfa.start
		for i = 1, #input do
			local sym = string.sub(input, i, i)
			local st = dfa.states[current]
			if not st then return false, current end
			local nxt = st.transitions[sym]
			if not nxt then return false, current end
			current = nxt
		end
		local st = dfa.states[current]
		return st ~= nil and st.accepting, current
	end

	export type GraphNode = { id: number, data: any }
	export type Graph = { nodes: {[number]: GraphNode}, edges: {[number]: {[number]: number}}, nodeCount: number }

	function MathUtils.graphNew(): Graph
		return { nodes={}, edges={}, nodeCount=0 }
	end

	function MathUtils.graphAddNode(g: Graph, data: any?): number
		g.nodeCount += 1
		local id = g.nodeCount
		g.nodes[id] = { id=id, data=data }
		g.edges[id] = {}
		return id
	end

	function MathUtils.graphAddEdge(g: Graph, from: number, to: number, weight: number?)
		g.edges[from][to] = weight or 1
	end

	function MathUtils.graphRemoveEdge(g: Graph, from: number, to: number)
		g.edges[from][to] = nil
	end

	function MathUtils.graphSuccessors(g: Graph, node: number): {number}
		local r: {number} = {}
		for to in pairs(g.edges[node] or {}) do table.insert(r, to) end
		return r
	end

	function MathUtils.graphPredecessors(g: Graph, node: number): {number}
		local r: {number} = {}
		for from, edges in pairs(g.edges) do
			if edges[node] then table.insert(r, from) end
		end
		return r
	end

	function MathUtils.graphTopoSort(g: Graph): ({number}?, string?)
		local inDeg: {[number]: number} = {}
		for id in pairs(g.nodes) do inDeg[id] = 0 end
		for _, edges in pairs(g.edges) do
			for to in pairs(edges) do inDeg[to] = (inDeg[to] or 0) + 1 end
		end
		local queue: {number} = {}
		for id, deg in pairs(inDeg) do if deg == 0 then table.insert(queue, id) end end
		local order: {number} = {}
		while #queue > 0 do
			table.sort(queue)
			local n = table.remove(queue, 1) :: number
			table.insert(order, n)
			for to in pairs(g.edges[n] or {}) do
				inDeg[to] -= 1
				if inDeg[to] == 0 then table.insert(queue, to) end
			end
		end
		if #order ~= g.nodeCount then return nil, "cycle" end
		return order, nil
	end

	function MathUtils.graphSCC(g: Graph): {{number}}
		local index = 0
		local stack: {number} = {}
		local onStack: {[number]: boolean} = {}
		local indices: {[number]: number} = {}
		local lowlinks: {[number]: number} = {}
		local sccs: {{number}} = {}
		local function strongConnect(v: number)
			indices[v] = index; lowlinks[v] = index; index += 1
			table.insert(stack, v); onStack[v] = true
			for w in pairs(g.edges[v] or {}) do
				if not indices[w] then
					strongConnect(w)
					lowlinks[v] = math.min(lowlinks[v], lowlinks[w])
				elseif onStack[w] then
					lowlinks[v] = math.min(lowlinks[v], indices[w])
				end
			end
			if lowlinks[v] == indices[v] then
				local scc: {number} = {}
				repeat
					local w = table.remove(stack) :: number
					onStack[w] = false
					table.insert(scc, w)
				until w == v
				table.insert(sccs, scc)
			end
		end
		for id in pairs(g.nodes) do if not indices[id] then strongConnect(id) end end
		return sccs
	end

	function MathUtils.graphDominators(g: Graph, entry: number): {[number]: number}
		local postOrder: {number} = {}
		local postOrderIdx: {[number]: number} = {}
		local visited: {[number]: boolean} = {}
		local function dfsPost(v: number)
			visited[v] = true
			for w in pairs(g.edges[v] or {}) do if not visited[w] then dfsPost(w) end end
			table.insert(postOrder, v)
			postOrderIdx[v] = #postOrder
		end
		dfsPost(entry)
		local idom: {[number]: number} = {}
		idom[entry] = entry
		local function intersect(b1: number, b2: number): number
			local f1, f2 = b1, b2
			while f1 ~= f2 do
				while postOrderIdx[f1] < postOrderIdx[f2] do f1 = idom[f1] end
				while postOrderIdx[f2] < postOrderIdx[f1] do f2 = idom[f2] end
			end
			return f1
		end
		local changed = true
		while changed do
			changed = false
			for i = #postOrder, 1, -1 do
				local b = postOrder[i]
				if b == entry then continue end
				local preds = MathUtils.graphPredecessors(g, b)
				local newIdom: number? = nil
				for _, p in ipairs(preds) do
					if idom[p] then
						newIdom = if newIdom then intersect(p, newIdom) else p
					end
				end
				if newIdom and idom[b] ~= newIdom then idom[b] = newIdom; changed = true end
			end
		end
		return idom
	end

	function MathUtils.graphDominatorTree(idom: {[number]: number}): {[number]: {number}}
		local children: {[number]: {number}} = {}
		for n, d in pairs(idom) do
			if n ~= d then
				if not children[d] then children[d] = {} end
				table.insert(children[d], n)
			end
		end
		return children
	end

	function MathUtils.graphColor(g: Graph): {[number]: number}
		local colors: {[number]: number} = {}
		local order: {number} = {}
		for id in pairs(g.nodes) do table.insert(order, id) end
		table.sort(order, function(a, b)
			local da, db = 0, 0
			for _ in pairs(g.edges[a] or {}) do da += 1 end
			for _ in pairs(g.edges[b] or {}) do db += 1 end
			return da > db
		end)
		for _, node in ipairs(order) do
			local used: {[number]: boolean} = {}
			for nb in pairs(g.edges[node] or {}) do if colors[nb] then used[colors[nb]] = true end end
			for other, edges in pairs(g.edges) do if edges[node] and colors[other] then used[colors[other]] = true end end
			local c = 1
			while used[c] do c += 1 end
			colors[node] = c
		end
		return colors
	end

	function MathUtils.graphLiveness(
		g: Graph,
		defs: {[number]: {string}},
		uses: {[number]: {string}}
	): ({[number]: {[string]: boolean}}, {[number]: {[string]: boolean}})
		local liveIn: {[number]: {[string]: boolean}} = {}
		local liveOut: {[number]: {[string]: boolean}} = {}
		for id in pairs(g.nodes) do liveIn[id] = {}; liveOut[id] = {} end
		local changed = true
		while changed do
			changed = false
			for id in pairs(g.nodes) do
				local newOut: {[string]: boolean} = {}
				for succ in pairs(g.edges[id] or {}) do
					for v in pairs(liveIn[succ] or {}) do newOut[v] = true end
				end
				local defSet: {[string]: boolean} = {}
				for _, v in ipairs(defs[id] or {}) do defSet[v] = true end
				local newIn: {[string]: boolean} = {}
				for v in pairs(newOut) do if not defSet[v] then newIn[v] = true end end
				for _, v in ipairs(uses[id] or {}) do newIn[v] = true end
				for v in pairs(newIn) do
					if not liveIn[id][v] then liveIn[id][v] = true; changed = true end
				end
				for v in pairs(newOut) do
					if not liveOut[id][v] then liveOut[id][v] = true; changed = true end
				end
			end
		end
		return liveIn, liveOut
	end

	function MathUtils.graphDijkstra(g: Graph, source: number): ({[number]: number}, {[number]: number?})
		local dist: {[number]: number} = {}
		local prev: {[number]: number?} = {}
		local visited: {[number]: boolean} = {}
		for id in pairs(g.nodes) do dist[id] = math.huge end
		dist[source] = 0
		local queue: {number} = {}
		for id in pairs(g.nodes) do table.insert(queue, id) end
		while #queue > 0 do
			table.sort(queue, function(a, b) return dist[a] < dist[b] end)
			local u = table.remove(queue, 1) :: number
			if dist[u] == math.huge then break end
			visited[u] = true
			for v, w in pairs(g.edges[u] or {}) do
				if not visited[v] then
					local alt = dist[u] + w
					if alt < dist[v] then dist[v] = alt; prev[v] = u end
				end
			end
		end
		return dist, prev
	end

	local NOISE_PERM: {number} = {}
	do
		local p = {151,160,137,91,90,15,131,13,201,95,96,53,194,233,7,225,140,36,103,30,69,142,8,99,37,240,21,10,23,190,6,148,247,120,234,75,0,26,197,62,94,252,219,203,117,35,11,32,57,177,33,88,237,149,56,87,174,20,125,136,171,168,68,175,74,165,71,134,139,48,27,166,77,146,158,231,83,111,229,122,60,211,133,230,220,105,92,41,55,46,245,40,244,102,143,54,65,25,63,161,1,216,80,73,209,76,132,187,208,89,18,169,200,196,135,130,116,188,159,86,164,100,109,198,173,186,3,64,52,217,226,250,124,123,5,202,38,147,118,126,255,82,85,212,207,206,59,227,47,16,58,17,182,189,28,42,223,183,170,213,119,248,152,2,44,154,163,70,221,153,101,155,167,43,172,9,129,22,39,253,19,98,108,110,79,113,224,232,178,185,112,104,218,246,97,228,251,34,242,193,238,210,144,12,191,179,162,241,81,51,145,235,249,14,239,107,49,192,214,31,181,199,106,157,184,84,204,176,115,121,50,45,127,4,150,254,138,236,205,93,222,114,67,29,24,72,243,141,128,195,78,66,215,61,156,180}
		for i = 1, 256 do NOISE_PERM[i] = p[i]; NOISE_PERM[i+256] = p[i] end
	end

	local function noiseFade(t: number): number return t*t*t*(t*(t*6-15)+10) end

	local function noiseGrad3(hash: number, x: number, y: number, z: number): number
		local h = bit32.band(hash, 15)
		local u = if h < 8 then x else y
		local v = if h < 4 then y elseif h == 12 or h == 14 then x else z
		return (if bit32.band(h,1)==0 then u else -u) + (if bit32.band(h,2)==0 then v else -v)
	end

	function MathUtils.perlin3(x: number, y: number, z: number): number
		local X = bit32.band(math.floor(x), 255)+1
		local Y = bit32.band(math.floor(y), 255)+1
		local Z = bit32.band(math.floor(z), 255)+1
		x -= math.floor(x); y -= math.floor(y); z -= math.floor(z)
		local u, v, w = noiseFade(x), noiseFade(y), noiseFade(z)
		local A  = NOISE_PERM[X]+Y
		local AA = NOISE_PERM[A]+Z;   local AB = NOISE_PERM[A+1]+Z
		local B  = NOISE_PERM[X+1]+Y
		local BA = NOISE_PERM[B]+Z;   local BB = NOISE_PERM[B+1]+Z
		local function lerp(t: number, a: number, b: number): number return a+t*(b-a) end
		return lerp(w,
			lerp(v, lerp(u, noiseGrad3(NOISE_PERM[AA],x,y,z),     noiseGrad3(NOISE_PERM[BA],x-1,y,z)),
				lerp(u, noiseGrad3(NOISE_PERM[AB],x,y-1,z),   noiseGrad3(NOISE_PERM[BB],x-1,y-1,z))),
			lerp(v, lerp(u, noiseGrad3(NOISE_PERM[AA+1],x,y,z-1), noiseGrad3(NOISE_PERM[BA+1],x-1,y,z-1)),
				lerp(u, noiseGrad3(NOISE_PERM[AB+1],x,y-1,z-1), noiseGrad3(NOISE_PERM[BB+1],x-1,y-1,z-1))))
	end

	function MathUtils.perlin2(x: number, y: number): number
		function MathUtils.catmullRomPoint(
			p0: Vector3, p1: Vector3, p2: Vector3, p3: Vector3,
			t: number, alpha: number?
		): Vector3
			local a = alpha or 0.5
			local function tij(pi: Vector3, pj: Vector3, prev: number): number
				return prev + math.max((pj-pi).Magnitude ^ a, EPSILON)
			end
			local t0 = 0; local t1 = tij(p0,p1,t0); local t2 = tij(p1,p2,t1); local t3 = tij(p2,p3,t2)
			local tv = t1 + t*(t2-t1)
			local function slerp(a2: Vector3, b: Vector3, ta: number, tb: number, tc: number): Vector3
				local d = tb-ta
				if math.abs(d) < EPSILON then return a2 end
				return a2 + (b-a2)*((tc-ta)/d)
			end
			local A1=slerp(p0,p1,t0,t1,tv); local A2=slerp(p1,p2,t1,t2,tv); local A3=slerp(p2,p3,t2,t3,tv)
			local B1=slerp(A1,A2,t0,t2,tv); local B2=slerp(A2,A3,t1,t3,tv)
			return slerp(B1,B2,t1,t2,tv)
		end

		function MathUtils.catmullRomChain(points: {Vector3}, t: number, alpha: number?): Vector3
			local n = #points
			if n < 2 then return points[1] or Vector3.zero end
			if n == 2 then return points[1]:Lerp(points[2], t) end
			local segments = n-1
			local scaled = t*segments
			local seg = math.min(math.floor(scaled), segments-1)
			local localT = scaled-seg
			local p0 = points[math.max(seg, 1)]
			local p1 = points[seg+1]
			local p2 = points[math.min(seg+2, n)]
			local p3 = points[math.min(seg+3, n)]
			function MathUtils.linearToSRGB(r: number, g: number, b: number): (number, number, number)
				local function f(c: number): number
					return if c <= 0.0031308 then 12.92*c else 1.055*c^(1/2.4)-0.055
				end
				return f(r), f(g), f(b)
			end

			function MathUtils.sRGBToLinear(r: number, g: number, b: number): (number, number, number)
				local function f(c: number): number
					return if c <= 0.04045 then c/12.92 else ((c+0.055)/1.055)^2.4
				end
				return f(r), f(g), f(b)
			end

			function MathUtils.rgbToHSL(r: number, g: number, b: number): (number, number, number)
				local mx=math.max(r,g,b); local mn=math.min(r,g,b)
				local l=(mx+mn)*0.5
				if mx==mn then return 0,0,l end
				local d=mx-mn
				local s=if l>0.5 then d/(2-mx-mn) else d/(mx+mn)
				local h: number = 0
				if mx==r then h=(g-b)/d+(if g<b then 6 else 0)
				elseif mx==g then h=(b-r)/d+2
				else h=(r-g)/d+4 end
				return h/6, s, l
			end

			function MathUtils.hslToRGB(h: number, s: number, l: number): (number, number, number)
				if s==0 then return l,l,l end
				local function hue2rgb(p: number, q: number, t: number): number
					if t<0 then t+=1 elseif t>1 then t-=1 end
					if t<1/6 then return p+(q-p)*6*t end
					if t<0.5 then return q end
					if t<2/3 then return p+(q-p)*(2/3-t)*6 end
					return p
				end
				local q=if l<0.5 then l*(1+s) else l+s-l*s
				local p=2*l-q
				return hue2rgb(p,q,h+1/3), hue2rgb(p,q,h), hue2rgb(p,q,h-1/3)
			end

			function MathUtils.sRGBToXYZ(r: number, g: number, b: number): (number, number, number)
				local rl,gl,bl = MathUtils.sRGBToLinear(r,g,b)
				return rl*0.4124564+gl*0.3575761+bl*0.1804375,
					rl*0.2126729+gl*0.7151522+bl*0.0721750,
					rl*0.0193339+gl*0.1191920+bl*0.9503041
			end

			function MathUtils.xyzToLab(x: number, y: number, z: number): (number, number, number)
				local function f(t: number): number
					return if t>0.008856 then t^(1/3) else 7.787*t+16/116
				end
				local fx=f(x/0.95047); local fy=f(y); local fz=f(z/1.08883)
				return 116*fy-16, 500*(fx-fy), 200*(fy-fz)
			end

			function MathUtils.colorDeltaE(r1:number,g1:number,b1:number, r2:number,g2:number,b2:number): number
				local x1,y1,z1=MathUtils.sRGBToXYZ(r1,g1,b1)
				local x2,y2,z2=MathUtils.sRGBToXYZ(r2,g2,b2)
				local L1,a1,b1l=MathUtils.xyzToLab(x1,y1,z1)
				local L2,a2,b2l=MathUtils.xyzToLab(x2,y2,z2)
				return math.sqrt((L2-L1)^2+(a2-a1)^2+(b2l-b1l)^2)
			end

			function MathUtils.tonemapReinhard(r: number, g: number, b: number): (number, number, number)
				return r/(1+r), g/(1+g), b/(1+b)
			end

			function MathUtils.tonemapACES(r: number, g: number, b: number): (number, number, number)
				local function aces(x: number): number
					return math.clamp((x*(2.51*x+0.03))/(x*(2.43*x+0.59)+0.14), 0, 1)
				end
				return aces(r), aces(g), aces(b)
			end

			function MathUtils.ggxNDF(NdotH: number, roughness: number): number
				local a2=(roughness*roughness)^2
				local d=NdotH*NdotH*(a2-1)+1
				return a2/(math.pi*d*d+EPSILON)
			end

			function MathUtils.schlickFresnel(F0: number, VdotH: number): number
				return F0+(1-F0)*(1-VdotH)^5
			end

			function MathUtils.smithG(NdotV: number, NdotL: number, roughness: number): number
				local k=(roughness+1)^2/8
				local function g1(NdotX: number): number return NdotX/(NdotX*(1-k)+k+EPSILON) end
				return g1(NdotV)*g1(NdotL)
			end

			function MathUtils.cookTorranceBRDF(
				NdotL: number, NdotV: number, NdotH: number, VdotH: number,
				roughness: number, F0: number
			): number
				local D=MathUtils.ggxNDF(NdotH,roughness)
				local G=MathUtils.smithG(NdotV,NdotL,roughness)
				local F=MathUtils.schlickFresnel(F0,VdotH)
				return D*G*F/(4*NdotV*NdotL+EPSILON)
			end

			function MathUtils.shEvalL2(dx: number, dy: number, dz: number): {number}
				return {
					0.282095,
					0.488603*dy, 0.488603*dz, 0.488603*dx,
					1.092548*dx*dy, 1.092548*dy*dz,
					0.315392*(3*dz*dz-1),
					1.092548*dx*dz, 0.546274*(dx*dx-dy*dy)
				}
			end

			function MathUtils.shProjectDirectional(
				dx: number, dy: number, dz: number,
				r: number, g: number, b: number
			): ({number}, {number}, {number})
				local basis = MathUtils.shEvalL2(dx,dy,dz)
				local cr: {number} = {}
				local cg: {number} = {}
				local cb: {number} = {}
				for i,v in ipairs(basis) do cr[i]=v*r; cg[i]=v*g; cb[i]=v*b end
				return cr, cg, cb
			end

			function MathUtils.shIrradiance(
				cr: {number}, cg: {number}, cb: {number},
				nx: number, ny: number, nz: number
			): (number, number, number)
				local basis = MathUtils.shEvalL2(nx,ny,nz)
				local r,g,b = 0,0,0
				for i,v in ipairs(basis) do r+=cr[i]*v; g+=cg[i]*v; b+=cb[i]*v end
				return math.max(r,0), math.max(g,0), math.max(b,0)
			end

			export type RNGState = { s: {number} }

			function MathUtils.rngNew(seed: number?): RNGState
				local function sm(x: number): number
					x = bit32.band(x+0x9e3779b9, 0xFFFFFFFF)
					x = bit32.bxor(x, bit32.rshift(x,16))
					x = bit32.band(x*0x85ebca6b, 0xFFFFFFFF)
					x = bit32.bxor(x, bit32.rshift(x,13))
					x = bit32.band(x*0xc2b2ae35, 0xFFFFFFFF)
					return bit32.bxor(x, bit32.rshift(x,16))
				end
				local s0 = sm(math.floor((seed or os.clock()*1e6)))
				return { s={sm(s0), sm(s0+1), sm(s0+2), sm(s0+3)} }
			end

			function MathUtils.rngNext(state: RNGState): number
				local s = state.s
				local result = bit32.band(bit32.lshift(bit32.band(s[2]*5,0xFFFFFFFF),7)*9, 0xFFFFFFFF)
				local t = bit32.lshift(s[2], 9)
				s[3]=bit32.bxor(s[3],s[1]); s[4]=bit32.bxor(s[4],s[2])
				s[2]=bit32.bxor(s[2],s[3]); s[1]=bit32.bxor(s[1],s[4])
				s[3]=bit32.bxor(s[3],t)
				s[4]=bit32.bor(bit32.lshift(s[4],11), bit32.rshift(s[4],21))
				return result/0xFFFFFFFF
			end

			function MathUtils.rngRange(state: RNGState, lo: number, hi: number): number
				return lo + MathUtils.rngNext(state)*(hi-lo)
			end

			function MathUtils.rngInt(state: RNGState, lo: number, hi: number): number
				return math.floor(lo + MathUtils.rngNext(state)*(hi-lo+1))
			end

			function MathUtils.rngGaussian(state: RNGState, mu: number?, sigma: number?): number
				local u1 = math.max(MathUtils.rngNext(state), 1e-10)
				local z = math.sqrt(-2*math.log(u1)) * math.cos(TWO_PI*MathUtils.rngNext(state))
				return (mu or 0) + z*(sigma or 1)
			end

			function MathUtils.rngExponential(state: RNGState, lambda: number?): number
				return -math.log(math.max(MathUtils.rngNext(state), 1e-10)) / (lambda or 1)
			end

			function MathUtils.rngPoisson(state: RNGState, lambda: number): number
				local L=math.exp(-lambda); local k=0; local p=1
				repeat k+=1; p*=MathUtils.rngNext(state) until p<=L
				return k-1
			end

			function MathUtils.rngOnSphere(state: RNGState): Vector3
				local x,y,s2
				repeat
					x=MathUtils.rngRange(state,-1,1); y=MathUtils.rngRange(state,-1,1); s2=x*x+y*y
				until s2<1
				local r=2*math.sqrt(1-s2)
				return Vector3.new(x*r, y*r, 1-2*s2)
			end

			function MathUtils.rngInDisk(state: RNGState): (number, number)
				local r=math.sqrt(MathUtils.rngNext(state))
				local theta=MathUtils.rngNext(state)*TWO_PI
				return r*math.cos(theta), r*math.sin(theta)
			end

			function MathUtils.halton(index: number, base: number): number
				local result,f,i = 0,1,index
				while i>0 do
					f=f/base; result+=f*(i%base); i=math.floor(i/base)
				end
				return result
			end

			function MathUtils.halton2D(index: number): (number, number)
				return MathUtils.halton(index,2), MathUtils.halton(index,3)
			end

			function MathUtils.poissonDisk2D(
				width: number, height: number,
				minDist: number, maxAttempts: number?,
				state: RNGState?
			): {Vector2}
				local attempts = maxAttempts or 30
				local rng = state or MathUtils.rngNew()
				local cellSize = minDist/math.sqrt(2)
				local gridW = math.ceil(width/cellSize)+1
				local grid: {[number]: Vector2} = {}
				local points: {Vector2} = {}; local active: {Vector2} = {}
				local function addPoint(p: Vector2)
					table.insert(points,p); table.insert(active,p)
					grid[math.floor(p.X/cellSize) + math.floor(p.Y/cellSize)*gridW] = p
				end
				addPoint(Vector2.new(MathUtils.rngRange(rng,0,width), MathUtils.rngRange(rng,0,height)))
				while #active > 0 do
					local idx = MathUtils.rngInt(rng,1,#active)
					local origin = active[idx]
					local found = false
					for _ = 1, attempts do
						local angle = MathUtils.rngRange(rng,0,TWO_PI)
						local r = MathUtils.rngRange(rng,minDist,2*minDist)
						local c = Vector2.new(origin.X+r*math.cos(angle), origin.Y+r*math.sin(angle))
						if c.X>=0 and c.X<width and c.Y>=0 and c.Y<height then
							local cx=math.floor(c.X/cellSize); local cy=math.floor(c.Y/cellSize)
							local ok = true
							for dx=-2,2 do
								for dy=-2,2 do
									local n = grid[(cx+dx)+(cy+dy)*gridW]
									if n and (n-c).Magnitude<minDist then ok=false; break end
								end
								if not ok then break end
							end
							if ok then addPoint(c); found=true; break end
						end
					end
					if not found then table.remove(active,idx) end
				end
				return points
			end

			export type IntervalTree = { root: any }

			local function iInsert(root: any, lo: number, hi: number, data: any): any
				if not root then return {lo=lo,hi=hi,max=hi,data=data} end
				if lo < root.lo then root.left = iInsert(root.left,lo,hi,data)
				else root.right = iInsert(root.right,lo,hi,data) end
				if hi > root.max then root.max=hi end
				return root
			end

			local function iQueryPoint(root: any, point: number, result: {any})
				if not root or point > root.max then return end
				if root.lo<=point and point<=root.hi then table.insert(result,root.data) end
				iQueryPoint(root.left,point,result); iQueryPoint(root.right,point,result)
			end

			local function iQueryOverlap(root: any, lo: number, hi: number, result: {any})
				if not root or lo > root.max then return end
				if root.lo<=hi and root.hi>=lo then table.insert(result,root.data) end
				iQueryOverlap(root.left,lo,hi,result); iQueryOverlap(root.right,lo,hi,result)
			end

			function MathUtils.intervalTreeNew(): IntervalTree return {root=nil} end

			function MathUtils.intervalTreeInsert(tree: IntervalTree, lo: number, hi: number, data: any)
				tree.root = iInsert(tree.root,lo,hi,data)
			end

			function MathUtils.intervalTreeQueryPoint(tree: IntervalTree, point: number): {any}
				local r: {any} = {}; iQueryPoint(tree.root,point,r); return r
			end

			function MathUtils.intervalTreeQueryOverlap(tree: IntervalTree, lo: number, hi: number): {any}
				local r: {any} = {}; iQueryOverlap(tree.root,lo,hi,r); return r
			end

			export type SegTree = { n: number, tree: {number}, lazy: {number}, combine: (number,number)->number, identity: number }

			function MathUtils.segTreeNew(n: number, identity: number, combine: (number,number)->number): SegTree
				local size = MathUtils.nextPow2(n)
				local tree: {number} = {}; local lazy: {number} = {}
				for i = 1, size*2 do tree[i]=identity; lazy[i]=0 end
				return {n=size, tree=tree, lazy=lazy, combine=combine, identity=identity}
			end

			local function segPush(st: SegTree, node: number)
				if st.lazy[node] ~= 0 then
					st.tree[node*2]+=st.lazy[node]; st.lazy[node*2]+=st.lazy[node]
					st.tree[node*2+1]+=st.lazy[node]; st.lazy[node*2+1]+=st.lazy[node]
					st.lazy[node]=0
				end
			end

			function MathUtils.segTreeUpdate(st: SegTree, i: number, val: number)
				i = i+st.n-1
				st.tree[i] = st.combine(st.tree[i], val)
				i = math.floor(i/2)
				while i >= 1 do
					st.tree[i] = st.combine(st.tree[i*2], st.tree[i*2+1])
					i = math.floor(i/2)
				end
			end

			function MathUtils.segTreeQuery(st: SegTree, l: number, r: number): number
				local result = st.identity
				l=l+st.n-1; r=r+st.n-1
				while l <= r do
					if l%2==1 then result=st.combine(result,st.tree[l]); l+=1 end
					if r%2==0 then result=st.combine(result,st.tree[r]); r-=1 end
					l=math.floor(l/2); r=math.floor(r/2)
				end
				return result
			end

			function MathUtils.segTreeRangeAdd(st: SegTree, l: number, r: number, val: number)
				local function update(node: number, nL: number, nR: number)
					if l>nR or r<nL then return end
					if l<=nL and nR<=r then st.tree[node]+=val; st.lazy[node]+=val; return end
					segPush(st,node)
					local mid=math.floor((nL+nR)/2)
					update(node*2,nL,mid); update(node*2+1,mid+1,nR)
					st.tree[node]=st.combine(st.tree[node*2], st.tree[node*2+1])
				end
				update(1,1,st.n)
			end

			return MathUtils.catmullRomPoint(p0, p1, p2, p3, localT, alpha)
		end

		function MathUtils.hermitePoint(p0: Vector3, m0: Vector3, p1: Vector3, m1: Vector3, t: number): Vector3
			local t2=t*t; local t3=t2*t
			return p0*(2*t3-3*t2+1) + m0*(t3-2*t2+t) + p1*(-2*t3+3*t2) + m1*(t3-t2)
		end

		function MathUtils.hermiteTangent(p0: Vector3, m0: Vector3, p1: Vector3, m1: Vector3, t: number): Vector3
			local t2=t*t
			return p0*(6*t2-6*t) + m0*(3*t2-4*t+1) + p1*(-6*t2+6*t) + m1*(3*t2-2*t)
		end

		function MathUtils.splineArcLengthRemap(splineFn: (number) -> Vector3, t: number, samples: number?): number
			local N = samples or 64
			local lengths: {number} = {0}
			local prev = splineFn(0)
			for i = 1, N do
				local cur = splineFn(i/N)
				lengths[i+1] = lengths[i] + (cur-prev).Magnitude
				prev = cur
			end
			local totalLen = lengths[N+1]
			if totalLen < EPSILON then return 0 end
			local target = t*totalLen
			local lo, hi = 1, N+1
			while lo < hi-1 do
				local mid = math.floor((lo+hi)/2)
				if lengths[mid] <= target then lo=mid else hi=mid end
			end
			local segLen = lengths[hi]-lengths[lo]
			if segLen < EPSILON then return (lo-1)/N end
			return ((lo-1) + (target-lengths[lo])/segLen) / N
		end

		function MathUtils.splineFrenetFrame(splineFn: (number) -> Vector3, t: number, dt: number?): (Vector3, Vector3, Vector3)
			local eps = dt or 0.001
			local tangent = splineFn(math.min(t+eps,1)) - splineFn(math.max(t-eps,0))
			if tangent.Magnitude < EPSILON then tangent = Vector3.yAxis end
			tangent = tangent.Unit
			local up = if math.abs(tangent:Dot(Vector3.yAxis)) > 0.99 then Vector3.zAxis else Vector3.yAxis
			local normal = tangent:Cross(up).Unit
			return tangent, normal, tangent:Cross(normal).Unit
		end

		export type AABB = { min: Vector3, max: Vector3 }
		export type BVHObject = { id: any, aabb: AABB }

		local function aabbUnion(a: AABB, b: AABB): AABB
			return {
				min = Vector3.new(math.min(a.min.X,b.min.X), math.min(a.min.Y,b.min.Y), math.min(a.min.Z,b.min.Z)),
				max = Vector3.new(math.max(a.max.X,b.max.X), math.max(a.max.Y,b.max.Y), math.max(a.max.Z,b.max.Z))
			}
		end

		local function aabbSA(a: AABB): number
			local d = a.max-a.min
			return 2*(d.X*d.Y+d.Y*d.Z+d.Z*d.X)
		end

		local function aabbCentroid(a: AABB): Vector3 return (a.min+a.max)*0.5 end

		local function aabbRay(a: AABB, origin: Vector3, invDir: Vector3): (boolean, number)
			local tmin = (a.min-origin)*invDir
			local tmax = (a.max-origin)*invDir
			local t1 = Vector3.new(math.min(tmin.X,tmax.X), math.min(tmin.Y,tmax.Y), math.min(tmin.Z,tmax.Z))
			local t2 = Vector3.new(math.max(tmin.X,tmax.X), math.max(tmin.Y,tmax.Y), math.max(tmin.Z,tmax.Z))
			local tN = math.max(t1.X,t1.Y,t1.Z)
			local tF = math.min(t2.X,t2.Y,t2.Z)
			return tF >= math.max(tN,0), tN
		end

		local function buildBVH(objects: {BVHObject}, maxLeaf: number): any
			if #objects == 0 then return { aabb={min=Vector3.zero,max=Vector3.zero} } end
			local bounds = objects[1].aabb
			for i = 2, #objects do bounds = aabbUnion(bounds, objects[i].aabb) end
			if #objects <= maxLeaf then return { aabb=bounds, objects=objects } end
			local bestCost, bestAxis, bestSplit = math.huge, 1, 1
			local invTotal = 1/math.max(aabbSA(bounds), EPSILON)
			for axis = 1, 3 do
				local sorted = table.clone(objects)
				table.sort(sorted, function(a: { id: any, aabb: any }, b: { id: any, aabb: any })
					local ca = aabbCentroid(a.aabb); local cb = aabbCentroid(b.aabb)
					return (if axis==1 then ca.X elseif axis==2 then ca.Y else ca.Z) <
						(if axis==1 then cb.X elseif axis==2 then cb.Y else cb.Z)
				end)
				for split = 1, #sorted-1 do
					local lb = sorted[1].aabb
					for i = 2, split do lb = aabbUnion(lb, sorted[i].aabb) end
					local rb = sorted[split+1].aabb
					for i = split+2, #sorted do rb = aabbUnion(rb, sorted[i].aabb) end
					local cost = 0.125 + (split*aabbSA(lb) + (#sorted-split)*aabbSA(rb))*invTotal
					if cost < bestCost then bestCost=cost; bestAxis=axis; bestSplit=split end
				end
			end
			local sorted2 = table.clone(objects)
			table.sort(sorted2, function(a: { id: any, aabb: any }, b: { id: any, aabb: any })
				local ca = aabbCentroid(a.aabb); local cb = aabbCentroid(b.aabb)
				return (if bestAxis==1 then ca.X elseif bestAxis==2 then ca.Y else ca.Z) <
					(if bestAxis==1 then cb.X elseif bestAxis==2 then cb.Y else cb.Z)
			end)
			local left: {BVHObject} = {}; local right: {BVHObject} = {}
			for i = 1, bestSplit do table.insert(left, sorted2[i]) end
			for i = bestSplit+1, #sorted2 do table.insert(right, sorted2[i]) end
			return { aabb=bounds, left=buildBVH(left,maxLeaf), right=buildBVH(right,maxLeaf) }
		end

		function MathUtils.bvhBuild(objects: {BVHObject}, maxLeaf: number?): any
			return buildBVH(objects, maxLeaf or 4)
		end

		function MathUtils.bvhQueryAABB(node: any, query: AABB): {any}
			local function overlap(a: AABB, b: AABB): boolean
				return a.min.X<=b.max.X and a.max.X>=b.min.X
					and a.min.Y<=b.max.Y and a.max.Y>=b.min.Y
					and a.min.Z<=b.max.Z and a.max.Z>=b.min.Z
			end
			local hits: {any} = {}
			local function traverse(n: any)
				if not overlap(n.aabb, query) then return end
				if n.objects then
					for _, obj in ipairs(n.objects :: {BVHObject}) do
						if overlap((obj :: BVHObject).aabb, query) then table.insert(hits, (obj :: BVHObject).id) end
					end
				else
					if n.left then traverse(n.left) end
					if n.right then traverse(n.right) end
				end
			end
			traverse(node); return hits
		end

		export type SpatialHash = { cellSize: number, cells: {[string]: {[any]: Vector3}} }

		function MathUtils.spatialHashNew(cellSize: number): SpatialHash
			return { cellSize=cellSize, cells={} }
		end

		local function shKey(sh: SpatialHash, pos: Vector3): string
			return math.floor(pos.X/sh.cellSize)..","..math.floor(pos.Y/sh.cellSize)..","..math.floor(pos.Z/sh.cellSize)
		end

		function MathUtils.spatialHashInsert(sh: SpatialHash, id: any, pos: Vector3)
			local key = shKey(sh, pos)
			if not sh.cells[key] then sh.cells[key] = {} end
			sh.cells[key][id] = pos
		end

		function MathUtils.spatialHashRemove(sh: SpatialHash, id: any, pos: Vector3)
			local key = shKey(sh, pos)
			if sh.cells[key] then sh.cells[key][id] = nil end
		end

		function MathUtils.spatialHashQueryRadius(sh: SpatialHash, pos: Vector3, radius: number): {any}
			local result: {any} = {}; local r2 = radius*radius
			local cells = math.ceil(radius/sh.cellSize)
			local cx=math.floor(pos.X/sh.cellSize); local cy=math.floor(pos.Y/sh.cellSize); local cz=math.floor(pos.Z/sh.cellSize)
			for dx = -cells, cells do
				for dy = -cells, cells do
					for dz = -cells, cells do
						local cell = sh.cells[(cx+dx)..","..(cy+dy)..","..(cz+dz)]
						if cell then
							for id, p in pairs(cell) do
								local d2=(p.X-pos.X)^2+(p.Y-pos.Y)^2+(p.Z-pos.Z)^2
								if d2 <= r2 then table.insert(result, id) end
							end
						end
					end
				end
			end
			return result
		end

		function MathUtils.spatialHashQueryAABB(sh: SpatialHash, minP: Vector3, maxP: Vector3): {any}
			local result: {any} = {}
			local x0=math.floor(minP.X/sh.cellSize); local x1=math.floor(maxP.X/sh.cellSize)
			local y0=math.floor(minP.Y/sh.cellSize); local y1=math.floor(maxP.Y/sh.cellSize)
			local z0=math.floor(minP.Z/sh.cellSize); local z1=math.floor(maxP.Z/sh.cellSize)
			for cx = x0, x1 do
				for cy = y0, y1 do
					for cz = z0, z1 do
						local cell = sh.cells[cx..","..cy..","..cz]
						if cell then
							for id, p in pairs(cell) do
								if p.X>=minP.X and p.X<=maxP.X and p.Y>=minP.Y and p.Y<=maxP.Y and p.Z>=minP.Z and p.Z<=maxP.Z then
									table.insert(result, id)
								end
							end
						end
					end
				end
			end
			return result
		end

		return MathUtils.perlin3(x, y, 0)
	end

	local SIMPLEX_F2 = 0.5*(math.sqrt(3)-1)
	local SIMPLEX_G2 = (3-math.sqrt(3))/6
	local SIMPLEX_GRAD2 = {{1,1},{-1,1},{1,-1},{-1,-1},{1,0},{-1,0},{1,0},{-1,0},{0,1},{0,-1},{0,1},{0,-1}}

	function MathUtils.simplex2(x: number, y: number): number
		local s = (x+y)*SIMPLEX_F2
		local i = math.floor(x+s); local j = math.floor(y+s)
		local t = (i+j)*SIMPLEX_G2
		local x0 = x-(i-t); local y0 = y-(j-t)
		local i1, j1
		if x0 > y0 then i1,j1 = 1,0 else i1,j1 = 0,1 end
		local x1 = x0-i1+SIMPLEX_G2; local y1 = y0-j1+SIMPLEX_G2
		local x2 = x0-1+2*SIMPLEX_G2; local y2 = y0-1+2*SIMPLEX_G2
		local ii = bit32.band(i,255)+1; local jj = bit32.band(j,255)+1
		local gi0 = NOISE_PERM[ii+NOISE_PERM[jj]] % 12 + 1
		local gi1 = NOISE_PERM[ii+i1+NOISE_PERM[jj+j1]] % 12 + 1
		local gi2 = NOISE_PERM[ii+1+NOISE_PERM[jj+1]] % 12 + 1
		local g = SIMPLEX_GRAD2
		local function corner(gi: number, cx: number, cy: number): number
			local t2 = 0.5-cx*cx-cy*cy
			if t2 < 0 then return 0 end
			t2 *= t2
			return t2*t2*(g[gi][1]*cx+g[gi][2]*cy)
		end
		return 70*(corner(gi0,x0,y0)+corner(gi1,x1,y1)+corner(gi2,x2,y2))
	end

	local SIMPLEX_F3 = 1/3; local SIMPLEX_G3 = 1/6
	local SIMPLEX_GRAD3 = {{1,1,0},{-1,1,0},{1,-1,0},{-1,-1,0},{1,0,1},{-1,0,1},{1,0,-1},{-1,0,-1},{0,1,1},{0,-1,1},{0,1,-1},{0,-1,-1}}

	function MathUtils.simplex3(x: number, y: number, z: number): number
		local s = (x+y+z)*SIMPLEX_F3
		local i = math.floor(x+s); local j = math.floor(y+s); local k = math.floor(z+s)
		local t = (i+j+k)*SIMPLEX_G3
		local x0,y0,z0 = x-(i-t), y-(j-t), z-(k-t)
		local i1,j1,k1,i2,j2,k2
		if x0 >= y0 then
			if y0 >= z0 then i1,j1,k1,i2,j2,k2=1,0,0,1,1,0
			elseif x0 >= z0 then i1,j1,k1,i2,j2,k2=1,0,0,1,0,1
			else i1,j1,k1,i2,j2,k2=0,0,1,1,0,1 end
		else
			if y0 < z0 then i1,j1,k1,i2,j2,k2=0,0,1,0,1,1
			elseif x0 < z0 then i1,j1,k1,i2,j2,k2=0,1,0,0,1,1
			else i1,j1,k1,i2,j2,k2=0,1,0,1,1,0 end
		end
		local x1=x0-i1+SIMPLEX_G3; local y1=y0-j1+SIMPLEX_G3; local z1=z0-k1+SIMPLEX_G3
		local x2=x0-i2+2*SIMPLEX_G3; local y2=y0-j2+2*SIMPLEX_G3; local z2=z0-k2+2*SIMPLEX_G3
		local x3=x0-1+3*SIMPLEX_G3; local y3=y0-1+3*SIMPLEX_G3; local z3=z0-1+3*SIMPLEX_G3
		local ii=bit32.band(i,255)+1; local jj=bit32.band(j,255)+1; local kk=bit32.band(k,255)+1
		local g = SIMPLEX_GRAD3
		local gi0=NOISE_PERM[ii+NOISE_PERM[jj+NOISE_PERM[kk]]] % 12+1
		local gi1=NOISE_PERM[ii+i1+NOISE_PERM[jj+j1+NOISE_PERM[kk+k1]]] % 12+1
		local gi2=NOISE_PERM[ii+i2+NOISE_PERM[jj+j2+NOISE_PERM[kk+k2]]] % 12+1
		local gi3=NOISE_PERM[ii+1+NOISE_PERM[jj+1+NOISE_PERM[kk+1]]] % 12+1
		local function corner3(gi: number, px: number, py: number, pz: number): number
			local t2 = 0.6-px*px-py*py-pz*pz
			if t2 < 0 then return 0 end
			t2 *= t2
			return t2*t2*(g[gi][1]*px+g[gi][2]*py+g[gi][3]*pz)
		end
		return 32*(corner3(gi0,x0,y0,z0)+corner3(gi1,x1,y1,z1)+corner3(gi2,x2,y2,z2)+corner3(gi3,x3,y3,z3))
	end

	function MathUtils.worley2(x: number, y: number, seed: number?): (number, number)
		local s = seed or 0
		local function cellPoint(cx: number, cy: number): (number, number)
			local h  = MathUtils.murmur3_32(cx..","..cy..","..s, s)
			local h2 = MathUtils.murmur3_32(cx..","..cy..":2:"..s, s+1)
			return cx + (bit32.band(h,0xFFFF)/65535.0), cy + (bit32.band(h2,0xFFFF)/65535.0)
		end
		local xi = math.floor(x); local yi = math.floor(y)
		local d1, d2 = math.huge, math.huge
		for dx = -1, 1 do
			for dy = -1, 1 do
				local px, py = cellPoint(xi+dx, yi+dy)
				local d = (px-x)*(px-x)+(py-y)*(py-y)
				if d < d1 then d2=d1; d1=d elseif d < d2 then d2=d end
			end
		end
		return math.sqrt(d1), math.sqrt(d2)
	end

	function MathUtils.fbm(
		noiseFn: (number, number) -> number,
		x: number, y: number,
		octaves: number, lacunarity: number?, gain: number?
	): number
		local lac = lacunarity or 2.0; local g = gain or 0.5
		local value, amplitude, frequency = 0.0, 0.5, 1.0
		for _ = 1, octaves do
			value += amplitude * noiseFn(x*frequency, y*frequency)
			frequency *= lac; amplitude *= g
		end
		return value
	end

	function MathUtils.ridgedFbm(
		noiseFn: (number, number) -> number,
		x: number, y: number, octaves: number
	): number
		local value, amplitude, frequency = 0.0, 0.5, 1.0
		for _ = 1, octaves do
			local n = 1 - math.abs(noiseFn(x*frequency, y*frequency))
			value += amplitude * n * n
			frequency *= 2.0; amplitude *= 0.5
		end
		return value
	end

	function MathUtils.domainWarp(
		noiseFn: (number, number) -> number,
		x: number, y: number, strength: number, octaves: number
	): number
		local wx = MathUtils.fbm(noiseFn, x+1.7, y+9.2, octaves)
		local wy = MathUtils.fbm(noiseFn, x+8.3, y+2.8, octaves)
		return MathUtils.fbm(noiseFn, x+strength*wx, y+strength*wy, octaves)
	end

function MathUtils.criticallyDampedSpring(
	current: number,
	target: number,
	velocity: number,
	omega: number,
	dt: number
): (number, number)
	local safeOmega = math.max(omega, EPSILON)
	local safeDt = math.max(dt, 0)
	local x = current - target
	local c = velocity + safeOmega * x
	local expTerm = math.exp(-safeOmega * safeDt)
	local newX = (x + c * safeDt) * expTerm
	local newVelocity = (c - safeOmega * (x + c * safeDt)) * expTerm
	return target + newX, newVelocity
end

function MathUtils.criticallyDampedSpringFromStiffness(
	current: number,
	target: number,
	velocity: number,
	stiffness: number,
	dt: number
): (number, number)
	return MathUtils.criticallyDampedSpring(current, target, velocity, math.sqrt(math.max(stiffness, EPSILON)), dt)
end

function MathUtils.smoothDamp(
	current: number,
	target: number,
	velocity: number,
	smoothTime: number,
	dt: number,
	maxSpeed: number?
): (number, number)
	smoothTime = math.max(0.0001, smoothTime)
	local omega = 2 / smoothTime
	local x = omega * dt
	local exp = 1 / (1 + x + 0.48 * x * x + 0.235 * x * x * x)

	local change = current - target
	local originalTarget = target

	if maxSpeed then
		local maxChange = maxSpeed * smoothTime
		change = math.min(maxChange, math.max(-maxChange, change))
		target = current - change
	end

	local temp = (velocity + omega * change) * dt
	velocity = (velocity - omega * temp) * exp
	local newPos = target + (change + temp) * exp

	local targetDirectionPositive = (originalTarget - current) > 0
	local outputPastTarget = (newPos - originalTarget) > 0
	if targetDirectionPositive == outputPastTarget then
		newPos = originalTarget
		velocity = 0
	end

	return newPos, velocity
end

function MathUtils.normalizeAngle(angle: number): number
	return angle - TWO_PI * math.floor((angle + math.pi) / TWO_PI)
end

function MathUtils.angleDifference(a: number, b: number): number
	local diff = (a - b) % TWO_PI
	if diff > math.pi then
		diff = diff - TWO_PI
	end
	return diff
end

function MathUtils.smoothDampAngle(
	current: number,
	target: number,
	velocity: number,
	smoothTime: number,
	dt: number,
	maxSpeed: number?
): (number, number)
	local radDiff = MathUtils.angleDifference(target, current)
	local newTarget = current + radDiff
	local newPos, newVel = MathUtils.smoothDamp(
		current, newTarget, velocity, smoothTime, dt, maxSpeed
	)
	return MathUtils.normalizeAngle(newPos), newVel
end

function MathUtils.scalarClamp01(value: number): number
	return math.clamp(value, 0, 1)
end

function MathUtils.scalarClampSigned(value: number): number
	return math.clamp(value, -1, 1)
end

function MathUtils.scalarSquare(value: number): number
	return value * value
end

function MathUtils.scalarCube(value: number): number
	return value * value * value
end

function MathUtils.scalarQuartic(value: number): number
	local squared = value * value
	return squared * squared
end

function MathUtils.scalarSignedSquare(value: number): number
	if value < 0 then
		return -(value * value)
	end
	return value * value
end

function MathUtils.scalarSafeDivide(numerator: number, denominator: number, fallback: number?): number
	if math.abs(denominator) < EPSILON then
		return fallback or 0
	end
	return numerator / denominator
end

function MathUtils.scalarSafeSqrt(value: number): number
	return math.sqrt(math.max(value, 0))
end

function MathUtils.scalarSafeLog(value: number, fallback: number?): number
	if value <= 0 then
		return fallback or 0
	end
	return math.log(value)
end

function MathUtils.scalarSafeAcos(value: number): number
	return math.acos(math.clamp(value, -1, 1))
end

function MathUtils.scalarSafeAsin(value: number): number
	return math.asin(math.clamp(value, -1, 1))
end

function MathUtils.scalarWrap01(value: number): number
	local wrapped = value - math.floor(value)
	return wrapped
end

function MathUtils.scalarWrap(value: number, minValue: number, maxValue: number): number
	local range = maxValue - minValue
	if math.abs(range) < EPSILON then
		return minValue
	end
	return ((value - minValue) % range) + minValue
end

function MathUtils.scalarPingPong(value: number, length: number): number
	local safeLength = math.max(math.abs(length), EPSILON)
	local t = value % (safeLength * 2)
	if t > safeLength then
		return safeLength * 2 - t
	end
	return t
end

function MathUtils.scalarPingPong01(value: number): number
	local t = value % 2
	if t > 1 then
		return 2 - t
	end
	return t
end

function MathUtils.scalarMoveTowards(current: number, target: number, maxDelta: number): number
	local delta = target - current
	local step = math.abs(maxDelta)
	if math.abs(delta) <= step then
		return target
	end
	return current + math.sign(delta) * step
end

function MathUtils.scalarExpDecayAlpha(decay: number, dt: number): number
	local safeDecay = math.max(decay, 0)
	local safeDt = math.max(dt, 0)
	return 1 - math.exp(-safeDecay * safeDt)
end

function MathUtils.scalarHalfLifeAlpha(halfLife: number, dt: number): number
	local safeHalfLife = math.max(halfLife, EPSILON)
	local safeDt = math.max(dt, 0)
	return 1 - 2 ^ (-safeDt / safeHalfLife)
end

function MathUtils.scalarDamp(current: number, target: number, decay: number, dt: number): number
	local alpha = MathUtils.scalarExpDecayAlpha(decay, dt)
	return current + (target - current) * alpha
end

function MathUtils.scalarHalfLifeDamp(current: number, target: number, halfLife: number, dt: number): number
	local alpha = MathUtils.scalarHalfLifeAlpha(halfLife, dt)
	return current + (target - current) * alpha
end

function MathUtils.scalarDeadZone(value: number, deadZone: number): number
	local threshold = math.abs(deadZone)
	if math.abs(value) <= threshold then
		return 0
	end
	return value - math.sign(value) * threshold
end

function MathUtils.scalarNormalizeDeadZone(value: number, deadZone: number, maxValue: number): number
	local raw = MathUtils.scalarDeadZone(value, deadZone)
	local range = math.max(math.abs(maxValue) - math.abs(deadZone), EPSILON)
	return math.clamp(raw / range, -1, 1)
end

function MathUtils.scalarQuantize(value: number, step: number): number
	local safeStep = math.max(math.abs(step), EPSILON)
	return math.floor(value / safeStep + 0.5) * safeStep
end

function MathUtils.scalarRoundTo(value: number, decimals: number): number
	local power = 10 ^ math.max(0, math.floor(decimals))
	return math.floor(value * power + 0.5) / power
end

function MathUtils.scalarApproximately(a: number, b: number, tolerance: number?): boolean
	local threshold = tolerance or EPSILON
	return math.abs(a - b) <= threshold
end

function MathUtils.scalarBetween(value: number, minValue: number, maxValue: number, inclusive: boolean?): boolean
	if inclusive == false then
		return value > minValue and value < maxValue
	end
	return value >= minValue and value <= maxValue
end

function MathUtils.scalarInverseSafe(value: number, fallback: number?): number
	if math.abs(value) < EPSILON then
		return fallback or 0
	end
	return 1 / value
end

function MathUtils.scalarRcpSqrtSafe(value: number, fallback: number?): number
	if value <= EPSILON then
		return fallback or 0
	end
	return 1 / math.sqrt(value)
end

function MathUtils.scalarNormalizeDegrees(angle: number): number
	local result = angle % 360
	if result < 0 then
		result += 360
	end
	return result
end

function MathUtils.scalarShortestDeltaDegrees(fromAngle: number, toAngle: number): number
	return (toAngle - fromAngle + 180) % 360 - 180
end

function MathUtils.scalarLerpAngleDegrees(fromAngle: number, toAngle: number, alpha: number): number
	local delta = MathUtils.scalarShortestDeltaDegrees(fromAngle, toAngle)
	return MathUtils.scalarNormalizeDegrees(fromAngle + delta * math.clamp(alpha, 0, 1))
end

function MathUtils.scalarDampAngleDegrees(current: number, target: number, decay: number, dt: number): number
	local delta = MathUtils.scalarShortestDeltaDegrees(current, target)
	local alpha = MathUtils.scalarExpDecayAlpha(decay, dt)
	return MathUtils.scalarNormalizeDegrees(current + delta * alpha)
end

function MathUtils.scalarMedian3(a: number, b: number, c: number): number
	local low = math.min(a, b)
	local high = math.max(a, b)
	return math.max(low, math.min(high, c))
end

function MathUtils.scalarSmoothPulse(edge0: number, edge1: number, edge2: number, edge3: number, value: number): number
	local riseT = math.clamp((value - edge0) / math.max(edge1 - edge0, EPSILON), 0, 1)
	local rise = riseT * riseT * (3 - 2 * riseT)
	local fallT = math.clamp((edge3 - value) / math.max(edge3 - edge2, EPSILON), 0, 1)
	local fall = fallT * fallT * (3 - 2 * fallT)
	return math.clamp(rise * fall, 0, 1)
end

function MathUtils.scalarBell01(value: number): number
	local x = math.clamp(value, 0, 1)
	return math.sin(x * math.pi)
end

function MathUtils.scalarParabola01(value: number, power: number): number
	local x = math.clamp(value, 0, 1)
	return (4 * x * (1 - x)) ^ math.max(power, 0)
end

function MathUtils.scalarBias(value: number, bias: number): number
	local x = math.clamp(value, 0, 1)
	local b = math.clamp(bias, EPSILON, 1 - EPSILON)
	return x / (((1 / b) - 2) * (1 - x) + 1)
end

function MathUtils.scalarGain(value: number, gain: number): number
	local x = math.clamp(value, 0, 1)
	local g = math.max(gain, EPSILON)
	if x < 0.5 then
		return 0.5 * ((2 * x) ^ g)
	end
	return 1 - 0.5 * ((2 - 2 * x) ^ g)
end

function MathUtils.scalarLogistic(value: number, steepness: number): number
	return 1 / (1 + math.exp(-value * steepness))
end

function MathUtils.scalarSoftplus(value: number, sharpness: number?): number
	local k = sharpness or 1
	return math.log(1 + math.exp(value * k)) / math.max(k, EPSILON)
end

function MathUtils.easeIn2(value: number): number
	local x = math.clamp(value, 0, 1)
	return x * x
end

function MathUtils.easeOut2(value: number): number
	local x = 1 - math.clamp(value, 0, 1)
	return 1 - x * x
end

function MathUtils.easeInOut2(value: number): number
	local x = math.clamp(value, 0, 1)
	if x < 0.5 then
		return 2 * x * x
	end
	return 1 - ((-2 * x + 2) ^ 2) * 0.5
end

function MathUtils.easeIn3(value: number): number
	local x = math.clamp(value, 0, 1)
	return x * x * x
end

function MathUtils.easeOut3(value: number): number
	local x = 1 - math.clamp(value, 0, 1)
	return 1 - x * x * x
end

function MathUtils.easeInOut3(value: number): number
	local x = math.clamp(value, 0, 1)
	if x < 0.5 then
		return 4 * x * x * x
	end
	return 1 - ((-2 * x + 2) ^ 3) * 0.5
end

function MathUtils.easeIn4(value: number): number
	local x = math.clamp(value, 0, 1)
	return x ^ 4
end

function MathUtils.easeOut4(value: number): number
	local x = 1 - math.clamp(value, 0, 1)
	return 1 - x ^ 4
end

function MathUtils.easeInOut4(value: number): number
	local x = math.clamp(value, 0, 1)
	if x < 0.5 then
		return 8 * x ^ 4
	end
	return 1 - ((-2 * x + 2) ^ 4) * 0.5
end

function MathUtils.easeIn5(value: number): number
	local x = math.clamp(value, 0, 1)
	return x ^ 5
end

function MathUtils.easeOut5(value: number): number
	local x = 1 - math.clamp(value, 0, 1)
	return 1 - x ^ 5
end

function MathUtils.easeInOut5(value: number): number
	local x = math.clamp(value, 0, 1)
	if x < 0.5 then
		return 16 * x ^ 5
	end
	return 1 - ((-2 * x + 2) ^ 5) * 0.5
end

function MathUtils.vector2Abs(value: Vector2): Vector2
	return Vector2.new(math.abs(value.X), math.abs(value.Y))
end

function MathUtils.vector2Sign(value: Vector2): Vector2
	return Vector2.new(math.sign(value.X), math.sign(value.Y))
end

function MathUtils.vector2Floor(value: Vector2): Vector2
	return Vector2.new(math.floor(value.X), math.floor(value.Y))
end

function MathUtils.vector2Ceil(value: Vector2): Vector2
	return Vector2.new(math.ceil(value.X), math.ceil(value.Y))
end

function MathUtils.vector2Round(value: Vector2): Vector2
	return Vector2.new(math.floor(value.X + 0.5), math.floor(value.Y + 0.5))
end

function MathUtils.vector2Clamp(value: Vector2, minValue: Vector2, maxValue: Vector2): Vector2
	return Vector2.new(math.clamp(value.X, minValue.X, maxValue.X), math.clamp(value.Y, minValue.Y, maxValue.Y))
end

function MathUtils.vector2ClampMagnitude(value: Vector2, maxMagnitude: number): Vector2
	local magnitude = value.Magnitude
	local limit = math.max(maxMagnitude, 0)
	if magnitude > limit and magnitude > EPSILON then
		return value / magnitude * limit
	end
	return value
end

function MathUtils.vector2MoveTowards(current: Vector2, target: Vector2, maxDistance: number): Vector2
	local delta = target - current
	local magnitude = delta.Magnitude
	local step = math.max(maxDistance, 0)
	if magnitude <= step or magnitude < EPSILON then
		return target
	end
	return current + delta / magnitude * step
end

function MathUtils.vector2WithMagnitude(direction: Vector2, magnitude: number, fallback: Vector2?): Vector2
	local base = direction
	if base.Magnitude < EPSILON then
		base = fallback or Vector2.new(1, 0)
	end
	return base.Unit * magnitude
end

function MathUtils.vector2Perpendicular(value: Vector2): Vector2
	return Vector2.new(-value.Y, value.X)
end

function MathUtils.vector2Cross(a: Vector2, b: Vector2): number
	return a.X * b.Y - a.Y * b.X
end

function MathUtils.vector2Rotate(value: Vector2, angle: number): Vector2
	local c = math.cos(angle)
	local s = math.sin(angle)
	return Vector2.new(value.X * c - value.Y * s, value.X * s + value.Y * c)
end

function MathUtils.vector2FromAngle(angle: number, magnitude: number?): Vector2
	local m = magnitude or 1
	return Vector2.new(math.cos(angle) * m, math.sin(angle) * m)
end

function MathUtils.vector2Angle(value: Vector2): number
	return math.atan2(value.Y, value.X)
end

function MathUtils.vector2Project(value: Vector2, normal: Vector2): Vector2
	local n = if normal.Magnitude < EPSILON then Vector2.new(1, 0) else normal.Unit
	return n * value:Dot(n)
end

function MathUtils.vector2Reject(value: Vector2, normal: Vector2): Vector2
	return value - MathUtils.vector2Project(value, normal)
end

function MathUtils.vector2Reflect(value: Vector2, normal: Vector2): Vector2
	local n = if normal.Magnitude < EPSILON then Vector2.new(0, 1) else normal.Unit
	return value - n * (2 * value:Dot(n))
end

function MathUtils.vector2Slide(value: Vector2, normal: Vector2): Vector2
	local n = if normal.Magnitude < EPSILON then Vector2.new(0, 1) else normal.Unit
	return value - n * value:Dot(n)
end

function MathUtils.vector2Damp(current: Vector2, target: Vector2, decay: number, dt: number): Vector2
	local alpha = MathUtils.scalarExpDecayAlpha(decay, dt)
	return current:Lerp(target, alpha)
end

function MathUtils.vector2DeadZone(value: Vector2, radius: number): Vector2
	local magnitude = value.Magnitude
	local threshold = math.max(radius, 0)
	if magnitude <= threshold then
		return Vector2.zero
	end
	return value / magnitude * (magnitude - threshold)
end

function MathUtils.vector2SnapToGrid(value: Vector2, gridSize: number): Vector2
	local grid = math.max(math.abs(gridSize), EPSILON)
	return Vector2.new(math.floor(value.X / grid + 0.5) * grid, math.floor(value.Y / grid + 0.5) * grid)
end

function MathUtils.vector2ComponentMin(value: Vector2): number
	return math.min(value.X, value.Y)
end

function MathUtils.vector2ComponentMax(value: Vector2): number
	return math.max(value.X, value.Y)
end

function MathUtils.vector2ComponentSum(value: Vector2): number
	return value.X + value.Y
end

function MathUtils.vector2ComponentProduct(value: Vector2): number
	return value.X * value.Y
end

function MathUtils.vector2ComponentAverage(value: Vector2): number
	return (value.X + value.Y) * 0.5
end

function MathUtils.vector2RotateAround(point: Vector2, pivot: Vector2, angle: number): Vector2
	return pivot + MathUtils.vector2Rotate(point - pivot, angle)
end

function MathUtils.vector3Abs(value: Vector3): Vector3
	return Vector3.new(math.abs(value.X), math.abs(value.Y), math.abs(value.Z))
end

function MathUtils.vector3Sign(value: Vector3): Vector3
	return Vector3.new(math.sign(value.X), math.sign(value.Y), math.sign(value.Z))
end

function MathUtils.vector3Floor(value: Vector3): Vector3
	return Vector3.new(math.floor(value.X), math.floor(value.Y), math.floor(value.Z))
end

function MathUtils.vector3Ceil(value: Vector3): Vector3
	return Vector3.new(math.ceil(value.X), math.ceil(value.Y), math.ceil(value.Z))
end

function MathUtils.vector3Round(value: Vector3): Vector3
	return Vector3.new(math.floor(value.X + 0.5), math.floor(value.Y + 0.5), math.floor(value.Z + 0.5))
end

function MathUtils.vector3Min(a: Vector3, b: Vector3): Vector3
	return Vector3.new(math.min(a.X, b.X), math.min(a.Y, b.Y), math.min(a.Z, b.Z))
end

function MathUtils.vector3Max(a: Vector3, b: Vector3): Vector3
	return Vector3.new(math.max(a.X, b.X), math.max(a.Y, b.Y), math.max(a.Z, b.Z))
end

function MathUtils.vector3Hadamard(a: Vector3, b: Vector3): Vector3
	return Vector3.new(a.X * b.X, a.Y * b.Y, a.Z * b.Z)
end

function MathUtils.vector3Reciprocal(value: Vector3, fallback: number?): Vector3
	local f = fallback or 0
	return Vector3.new(
		MathUtils.safeDivide(1, value.X, f),
		MathUtils.safeDivide(1, value.Y, f),
		MathUtils.safeDivide(1, value.Z, f)
	)
end

function MathUtils.vector3Clamp(value: Vector3, minValue: Vector3, maxValue: Vector3): Vector3
	return Vector3.new(
		math.clamp(value.X, minValue.X, maxValue.X),
		math.clamp(value.Y, minValue.Y, maxValue.Y),
		math.clamp(value.Z, minValue.Z, maxValue.Z)
	)
end

function MathUtils.vector3ClampMagnitude(value: Vector3, maxMagnitude: number): Vector3
	local magnitude = value.Magnitude
	local limit = math.max(maxMagnitude, 0)
	if magnitude > limit and magnitude > EPSILON then
		return value / magnitude * limit
	end
	return value
end

function MathUtils.vector3MoveTowards(current: Vector3, target: Vector3, maxDistance: number): Vector3
	local delta = target - current
	local magnitude = delta.Magnitude
	local step = math.max(maxDistance, 0)
	if magnitude <= step or magnitude < EPSILON then
		return target
	end
	return current + delta / magnitude * step
end

function MathUtils.vector3WithMagnitude(direction: Vector3, magnitude: number, fallback: Vector3?): Vector3
	local base = direction
	if base.Magnitude < EPSILON then
		base = fallback or Vector3.xAxis
	end
	return base.Unit * magnitude
end

function MathUtils.vector3FlattenY(value: Vector3): Vector3
	return Vector3.new(value.X, 0, value.Z)
end

function MathUtils.vector3ReplaceY(value: Vector3, y: number): Vector3
	return Vector3.new(value.X, y, value.Z)
end

function MathUtils.vector3HorizontalMagnitude(value: Vector3): number
	return Vector3.new(value.X, 0, value.Z).Magnitude
end

function MathUtils.vector3HorizontalUnit(value: Vector3, fallback: Vector3?): Vector3
	local flat = Vector3.new(value.X, 0, value.Z)
	if flat.Magnitude < EPSILON then
		return fallback or Vector3.zAxis
	end
	return flat.Unit
end

function MathUtils.vector3Project(value: Vector3, normal: Vector3): Vector3
	return MathUtils.projectVector(value, normal)
end

function MathUtils.vector3Reject(value: Vector3, normal: Vector3): Vector3
	return MathUtils.rejectVector(value, normal)
end

function MathUtils.vector3Reflect(value: Vector3, normal: Vector3): Vector3
	return MathUtils.reflectVector(value, normal)
end

function MathUtils.vector3Slide(value: Vector3, normal: Vector3): Vector3
	return MathUtils.slideVector(value, normal)
end

function MathUtils.vector3Damp(current: Vector3, target: Vector3, decay: number, dt: number): Vector3
	local alpha = MathUtils.scalarExpDecayAlpha(decay, dt)
	return current:Lerp(target, alpha)
end

function MathUtils.vector3DeadZone(value: Vector3, radius: number): Vector3
	local magnitude = value.Magnitude
	local threshold = math.max(radius, 0)
	if magnitude <= threshold then
		return Vector3.zero
	end
	return value / magnitude * (magnitude - threshold)
end

function MathUtils.vector3SnapToGrid(value: Vector3, gridSize: number): Vector3
	local grid = math.max(math.abs(gridSize), EPSILON)
	return Vector3.new(math.floor(value.X / grid + 0.5) * grid, math.floor(value.Y / grid + 0.5) * grid, math.floor(value.Z / grid + 0.5) * grid)
end

function MathUtils.vector3ComponentMin(value: Vector3): number
	return math.min(value.X, value.Y, value.Z)
end

function MathUtils.vector3ComponentMax(value: Vector3): number
	return math.max(value.X, value.Y, value.Z)
end

function MathUtils.vector3ComponentSum(value: Vector3): number
	return value.X + value.Y + value.Z
end

function MathUtils.vector3ComponentProduct(value: Vector3): number
	return value.X * value.Y * value.Z
end

function MathUtils.vector3ComponentAverage(value: Vector3): number
	return (value.X + value.Y + value.Z) / 3
end

function MathUtils.vector3DominantAxis(value: Vector3): Vector3
	local a = MathUtils.vector3Abs(value)
	if a.X >= a.Y and a.X >= a.Z then
		return Vector3.new(math.sign(value.X), 0, 0)
	elseif a.Y >= a.Z then
		return Vector3.new(0, math.sign(value.Y), 0)
	end
	return Vector3.new(0, 0, math.sign(value.Z))
end

function MathUtils.vector3LeastAxis(value: Vector3): Vector3
	local a = MathUtils.vector3Abs(value)
	if a.X <= a.Y and a.X <= a.Z then
		return Vector3.xAxis
	elseif a.Y <= a.Z then
		return Vector3.yAxis
	end
	return Vector3.zAxis
end

function MathUtils.vector3RotateAroundAxis(value: Vector3, axis: Vector3, angle: number): Vector3
	local n = MathUtils.safeUnit(axis, Vector3.yAxis)
	return CFrame.fromAxisAngle(n, angle):VectorToWorldSpace(value)
end

function MathUtils.vector3RotateAroundPoint(point: Vector3, pivot: Vector3, axis: Vector3, angle: number): Vector3
	local offset = point - pivot
	return pivot + MathUtils.vector3RotateAroundAxis(offset, axis, angle)
end

function MathUtils.vector3AngleBetween(a: Vector3, b: Vector3): number
	local ua = MathUtils.safeUnit(a, Vector3.xAxis)
	local ub = MathUtils.safeUnit(b, Vector3.xAxis)
	return math.acos(math.clamp(ua:Dot(ub), -1, 1))
end

function MathUtils.vector3SignedAngleAroundAxis(a: Vector3, b: Vector3, axis: Vector3): number
	local n = MathUtils.safeUnit(axis, Vector3.yAxis)
	local pa = MathUtils.vector3Reject(a, n)
	local pb = MathUtils.vector3Reject(b, n)
	local angle = MathUtils.vector3AngleBetween(pa, pb)
	return angle * math.sign(n:Dot(pa:Cross(pb)))
end

function MathUtils.vector3Orthogonal(direction: Vector3): Vector3
	local n = MathUtils.safeUnit(direction, Vector3.yAxis)
	local axis = if math.abs(n.Y) < 0.9 then Vector3.yAxis else Vector3.xAxis
	return MathUtils.safeUnit(n:Cross(axis), Vector3.zAxis)
end

function MathUtils.vector3BuildBasisRight(forward: Vector3, up: Vector3?): Vector3
	local f = MathUtils.safeUnit(forward, Vector3.new(0, 0, -1))
	local u = MathUtils.safeUnit(up or Vector3.yAxis, Vector3.yAxis)
	return MathUtils.safeUnit(u:Cross(f), Vector3.xAxis)
end

function MathUtils.vector3BuildBasisUp(forward: Vector3, up: Vector3?): Vector3
	local f = MathUtils.safeUnit(forward, Vector3.new(0, 0, -1))
	local r = MathUtils.vector3BuildBasisRight(f, up)
	return MathUtils.safeUnit(f:Cross(r), Vector3.yAxis)
end

function MathUtils.vector3ProjectOnPlane(point: Vector3, planePoint: Vector3, planeNormal: Vector3): Vector3
	local n = MathUtils.safeUnit(planeNormal, Vector3.yAxis)
	return point - n * (point - planePoint):Dot(n)
end

function MathUtils.vector3MirrorAcrossPlane(point: Vector3, planePoint: Vector3, planeNormal: Vector3): Vector3
	local n = MathUtils.safeUnit(planeNormal, Vector3.yAxis)
	return point - n * (2 * (point - planePoint):Dot(n))
end

function MathUtils.vector3BezierQuadratic(a: Vector3, b: Vector3, c: Vector3, t: number): Vector3
	local x = math.clamp(t, 0, 1)
	local u = 1 - x
	return a * (u * u) + b * (2 * u * x) + c * (x * x)
end

function MathUtils.vector3BezierCubic(a: Vector3, b: Vector3, c: Vector3, d: Vector3, t: number): Vector3
	local x = math.clamp(t, 0, 1)
	local u = 1 - x
	return a * (u * u * u) + b * (3 * u * u * x) + c * (3 * u * x * x) + d * (x * x * x)
end

function MathUtils.vector3CatmullRom(p0: Vector3, p1: Vector3, p2: Vector3, p3: Vector3, t: number): Vector3
	local x = math.clamp(t, 0, 1)
	local x2 = x * x
	local x3 = x2 * x
	return (p1 * 2 + (p2 - p0) * x + (p0 * 2 - p1 * 5 + p2 * 4 - p3) * x2 + (-p0 + p1 * 3 - p2 * 3 + p3) * x3) * 0.5
end

function MathUtils.cameraYawPitchFromCFrame(cameraCFrame: CFrame): (number, number)
	local look = cameraCFrame.LookVector
	local yaw = math.atan2(-look.X, -look.Z)
	local pitch = math.asin(math.clamp(look.Y, -1, 1))
	return yaw, pitch
end

function MathUtils.cameraClampYawPitch(yaw: number, pitch: number, minPitch: number, maxPitch: number): (number, number)
	local safeYaw = MathUtils.normalizeAngle(yaw)
	local safePitch = math.clamp(pitch, minPitch, maxPitch)
	return safeYaw, safePitch
end

function MathUtils.cameraVelocityLead(position: Vector3, velocity: Vector3, leadTime: number, maxDistance: number): Vector3
	local lead = velocity * math.max(leadTime, 0)
	lead = MathUtils.vector3ClampMagnitude(lead, maxDistance)
	return position + lead
end

function MathUtils.cameraSoftFov(currentFov: number, targetFov: number, halfLife: number, dt: number): number
	local alpha = MathUtils.scalarHalfLifeAlpha(halfLife, dt)
	return currentFov + (targetFov - currentFov) * alpha
end

function MathUtils.cameraDistanceForWidth(width: number, horizontalFovRadians: number): number
	local halfWidth = math.max(width, EPSILON) * 0.5
	return halfWidth / math.max(math.tan(horizontalFovRadians * 0.5), EPSILON)
end

function MathUtils.cameraHorizontalFov(verticalFovRadians: number, aspect: number): number
	local safeAspect = math.max(aspect, EPSILON)
	return 2 * math.atan(math.tan(verticalFovRadians * 0.5) * safeAspect)
end

function MathUtils.cameraVerticalFov(horizontalFovRadians: number, aspect: number): number
	local safeAspect = math.max(aspect, EPSILON)
	return 2 * math.atan(math.tan(horizontalFovRadians * 0.5) / safeAspect)
end

function MathUtils.cameraScreenToNdc(point: Vector2, viewportSize: Vector2): Vector2
	local x = (point.X / math.max(viewportSize.X, EPSILON)) * 2 - 1
	local y = 1 - (point.Y / math.max(viewportSize.Y, EPSILON)) * 2
	return Vector2.new(x, y)
end

function MathUtils.cameraNdcToScreen(point: Vector2, viewportSize: Vector2): Vector2
	local x = (point.X + 1) * 0.5 * viewportSize.X
	local y = (1 - point.Y) * 0.5 * viewportSize.Y
	return Vector2.new(x, y)
end

function MathUtils.cameraPanAtDistance(cameraCFrame: CFrame, ndcDelta: Vector2, distance: number, verticalFovRadians: number, aspect: number): Vector3
	local halfY = math.tan(verticalFovRadians * 0.5) * distance
	local halfX = halfY * aspect
	return cameraCFrame.RightVector * (ndcDelta.X * halfX) + cameraCFrame.UpVector * (ndcDelta.Y * halfY)
end

function MathUtils.cameraRollFromVelocity(velocity: Vector3, cameraRight: Vector3, maxRoll: number, speedForMax: number): number
	local side = velocity:Dot(cameraRight)
	local alpha = math.clamp(side / math.max(speedForMax, EPSILON), -1, 1)
	return -alpha * maxRoll
end

function MathUtils.cameraPitchFromVelocity(velocity: Vector3, cameraLook: Vector3, maxPitch: number, speedForMax: number): number
	local forward = velocity:Dot(cameraLook)
	local alpha = math.clamp(forward / math.max(speedForMax, EPSILON), -1, 1)
	return alpha * maxPitch
end

function MathUtils.cameraFocusPlanePoint(cameraCFrame: CFrame, distance: number, viewportOffset: Vector2, verticalFovRadians: number, aspect: number): Vector3
	local center = cameraCFrame.Position + cameraCFrame.LookVector * distance
	return center + MathUtils.cameraPanAtDistance(cameraCFrame, viewportOffset, distance, verticalFovRadians, aspect)
end

function MathUtils.cameraShakeTraumaDecay(trauma: number, decayPerSecond: number, dt: number): number
	local decay = math.max(decayPerSecond, 0) * math.max(dt, 0)
	return math.max(0, trauma - decay)
end

function MathUtils.cameraShakeFromTrauma(seed: number, time: number, trauma: number, amplitude: Vector3, frequency: number): Vector3
	local strength = math.clamp(trauma, 0, 1) ^ 2
	local t = time * frequency
	local octaves = 3
	return Vector3.new(
		MathUtils.fbmNoise3D(seed, t, octaves),
		MathUtils.fbmNoise3D(seed + 1, t, octaves),
		MathUtils.fbmNoise3D(seed + 2, t, octaves)
	) * strength * amplitude
end

function MathUtils.cameraCollisionPadding(distance: number, basePadding: number, distanceScale: number): number
	return math.max(0, basePadding + math.max(distance, 0) * distanceScale)
end

function MathUtils.cameraObstructionAlpha(clearDistance: number, blockedDistance: number): number
	return math.clamp(blockedDistance / math.max(clearDistance, EPSILON), 0, 1)
end

function MathUtils.collisionAABBContainsPoint(minPoint: Vector3, maxPoint: Vector3, point: Vector3): boolean
	return point.X >= minPoint.X and point.X <= maxPoint.X and point.Y >= minPoint.Y and point.Y <= maxPoint.Y and point.Z >= minPoint.Z and point.Z <= maxPoint.Z
end

function MathUtils.collisionOBBContainsPoint(boxCFrame: CFrame, halfExtents: Vector3, point: Vector3): boolean
	local p = boxCFrame:PointToObjectSpace(point)
	return math.abs(p.X) <= halfExtents.X and math.abs(p.Y) <= halfExtents.Y and math.abs(p.Z) <= halfExtents.Z
end

function MathUtils.collisionAABBCenter(minPoint: Vector3, maxPoint: Vector3): Vector3
	return (minPoint + maxPoint) * 0.5
end

function MathUtils.collisionAABBSize(minPoint: Vector3, maxPoint: Vector3): Vector3
	return maxPoint - minPoint
end

function MathUtils.collisionAABBHalfExtents(minPoint: Vector3, maxPoint: Vector3): Vector3
	return (maxPoint - minPoint) * 0.5
end

function MathUtils.collisionAABBFromCenterSize(center: Vector3, size: Vector3): (Vector3, Vector3)
	local half = size * 0.5
	return center - half, center + half
end

function MathUtils.collisionAABBInflate(minPoint: Vector3, maxPoint: Vector3, amount: number): (Vector3, Vector3)
	local v = Vector3.one * amount
	return minPoint - v, maxPoint + v
end

function MathUtils.collisionAABBUnion(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): (Vector3, Vector3)
	local minPoint = Vector3.new(math.min(minA.X, minB.X), math.min(minA.Y, minB.Y), math.min(minA.Z, minB.Z))
	local maxPoint = Vector3.new(math.max(maxA.X, maxB.X), math.max(maxA.Y, maxB.Y), math.max(maxA.Z, maxB.Z))
	return minPoint, maxPoint
end

function MathUtils.collisionAABBIntersection(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): (boolean, Vector3, Vector3)
	local minPoint = Vector3.new(math.max(minA.X, minB.X), math.max(minA.Y, minB.Y), math.max(minA.Z, minB.Z))
	local maxPoint = Vector3.new(math.min(maxA.X, maxB.X), math.min(maxA.Y, maxB.Y), math.min(maxA.Z, maxB.Z))
	local hit = minPoint.X <= maxPoint.X and minPoint.Y <= maxPoint.Y and minPoint.Z <= maxPoint.Z
	return hit, minPoint, maxPoint
end

function MathUtils.collisionAABBVolume(minPoint: Vector3, maxPoint: Vector3): number
	local size = maxPoint - minPoint
	return math.max(size.X, 0) * math.max(size.Y, 0) * math.max(size.Z, 0)
end

function MathUtils.collisionAABBSurfaceArea(minPoint: Vector3, maxPoint: Vector3): number
	local size = maxPoint - minPoint
	local x = math.max(size.X, 0)
	local y = math.max(size.Y, 0)
	local z = math.max(size.Z, 0)
	return 2 * (x * y + y * z + z * x)
end

function MathUtils.collisionAABBDiagonal(minPoint: Vector3, maxPoint: Vector3): number
	return (maxPoint - minPoint).Magnitude
end

function MathUtils.collisionSphereContainsPoint(center: Vector3, radius: number, point: Vector3): boolean
	local delta = point - center
	return delta:Dot(delta) <= radius * radius
end

function MathUtils.collisionCapsuleContainsPoint(a: Vector3, b: Vector3, radius: number, point: Vector3): boolean
	local closest = MathUtils.closestPointOnSegment(point, a, b)
	local delta = point - closest
	return delta:Dot(delta) <= radius * radius
end

function MathUtils.collisionPlaneSignedDistance(point: Vector3, planeNormal: Vector3, planeD: number): number
	local n = MathUtils.safeUnit(planeNormal, Vector3.yAxis)
	return n:Dot(point) + planeD
end

function MathUtils.collisionClassifySpherePlane(center: Vector3, radius: number, planeNormal: Vector3, planeD: number): number
	local distance = MathUtils.collisionPlaneSignedDistance(center, planeNormal, planeD)
	if distance > radius then
		return 1
	elseif distance < -radius then
		return -1
	end
	return 0
end

function MathUtils.collisionRayPlaneTime(origin: Vector3, direction: Vector3, planeNormal: Vector3, planeD: number): (boolean, number)
	local denom = planeNormal:Dot(direction)
	if math.abs(denom) < EPSILON then
		return false, 0
	end
	return true, -(planeNormal:Dot(origin) + planeD) / denom
end

function MathUtils.collisionSegmentPlaneTime(a: Vector3, b: Vector3, planeNormal: Vector3, planeD: number): (boolean, number)
	local hit, t = MathUtils.collisionRayPlaneTime(a, b - a, planeNormal, planeD)
	return hit and t >= 0 and t <= 1, t
end

function MathUtils.collisionSphereAABBDistance(center: Vector3, radius: number, minPoint: Vector3, maxPoint: Vector3): number
	local closest = MathUtils.closestPointOnAABB(center, minPoint, maxPoint)
	return math.max((center - closest).Magnitude - radius, 0)
end

function MathUtils.collisionPointTriangleBarycentric(point: Vector3, a: Vector3, b: Vector3, c: Vector3): Vector3?
	local v0 = b - a
	local v1 = c - a
	local v2 = point - a
	local d00 = v0:Dot(v0)
	local d01 = v0:Dot(v1)
	local d11 = v1:Dot(v1)
	local d20 = v2:Dot(v0)
	local d21 = v2:Dot(v1)
	local denom = d00 * d11 - d01 * d01
	if math.abs(denom) < EPSILON then
		return nil
	end
	local v = (d11 * d20 - d01 * d21) / denom
	local w = (d00 * d21 - d01 * d20) / denom
	return Vector3.new(1 - v - w, v, w)
end

function MathUtils.collisionBarycentricInside(barycentric: Vector3, tolerance: number?): boolean
	local t = tolerance or 0
	local sum = barycentric.X + barycentric.Y + barycentric.Z
	return barycentric.X >= -t and barycentric.Y >= -t and barycentric.Z >= -t and math.abs(sum - 1) <= math.max(t, EPSILON)
end

function MathUtils.collisionResolvePosition(position: Vector3, normal: Vector3, depth: number, slop: number?): Vector3
	if depth <= (slop or 0) then
		return position
	end
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	return position + n * (depth - (slop or 0))
end

function MathUtils.collisionBounceVelocity(velocity: Vector3, normal: Vector3, restitution: number): Vector3
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	local vn = velocity:Dot(n)
	if vn >= 0 then
		return velocity
	end
	return velocity - n * ((1 + math.clamp(restitution, 0, 1)) * vn)
end

function MathUtils.collisionFrictionVelocity(velocity: Vector3, normal: Vector3, friction: number): Vector3
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	local tangent = velocity - n * velocity:Dot(n)
	return velocity - tangent * math.clamp(friction, 0, 1)
end

function MathUtils.collisionIsSeparating(relativeVelocity: Vector3, normal: Vector3): boolean
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	return relativeVelocity:Dot(n) > 0
end

function MathUtils.gridWorldToCell2D(position: Vector3, cellSize: number): Vector2
	local size = math.max(cellSize, EPSILON)
	return Vector2.new(math.floor(position.X / size), math.floor(position.Z / size))
end

function MathUtils.gridCellToWorld2D(cell: Vector2, cellSize: number, y: number?): Vector3
	local size = math.max(cellSize, EPSILON)
	return Vector3.new((cell.X + 0.5) * size, y or 0, (cell.Y + 0.5) * size)
end

function MathUtils.gridWorldToCell3D(position: Vector3, cellSize: number): Vector3
	local size = math.max(cellSize, EPSILON)
	return Vector3.new(math.floor(position.X / size), math.floor(position.Y / size), math.floor(position.Z / size))
end

function MathUtils.gridCellToWorld3D(cell: Vector3, cellSize: number): Vector3
	local size = math.max(cellSize, EPSILON)
	return (cell + Vector3.one * 0.5) * size
end

function MathUtils.gridManhattan2D(a: Vector2, b: Vector2): number
	return math.abs(a.X - b.X) + math.abs(a.Y - b.Y)
end

function MathUtils.gridChebyshev2D(a: Vector2, b: Vector2): number
	return math.max(math.abs(a.X - b.X), math.abs(a.Y - b.Y))
end

function MathUtils.gridManhattan3D(a: Vector3, b: Vector3): number
	return math.abs(a.X - b.X) + math.abs(a.Y - b.Y) + math.abs(a.Z - b.Z)
end

function MathUtils.gridChebyshev3D(a: Vector3, b: Vector3): number
	return math.max(math.abs(a.X - b.X), math.abs(a.Y - b.Y), math.abs(a.Z - b.Z))
end

function MathUtils.gridCellKey2D(cell: Vector2): string
	return tostring(math.floor(cell.X)) .. ":" .. tostring(math.floor(cell.Y))
end

function MathUtils.gridCellKey3D(cell: Vector3): string
	return tostring(math.floor(cell.X)) .. ":" .. tostring(math.floor(cell.Y)) .. ":" .. tostring(math.floor(cell.Z))
end

function MathUtils.gridNeighbor4(cell: Vector2): { Vector2 }
	return {
		cell + Vector2.new(1, 0),
		cell + Vector2.new(-1, 0),
		cell + Vector2.new(0, 1),
		cell + Vector2.new(0, -1),
	}
end

function MathUtils.gridNeighbor8(cell: Vector2): { Vector2 }
	return {
		cell + Vector2.new(1, 0),
		cell + Vector2.new(-1, 0),
		cell + Vector2.new(0, 1),
		cell + Vector2.new(0, -1),
		cell + Vector2.new(1, 1),
		cell + Vector2.new(1, -1),
		cell + Vector2.new(-1, 1),
		cell + Vector2.new(-1, -1),
	}
end

function MathUtils.gridHeuristicOctile(a: Vector2, b: Vector2): number
	local dx = math.abs(a.X - b.X)
	local dy = math.abs(a.Y - b.Y)
	return math.max(dx, dy) + (math.sqrt(2) - 1) * math.min(dx, dy)
end

function MathUtils.gridHeuristicEuclidean(a: Vector2, b: Vector2): number
	return (a - b).Magnitude
end

function MathUtils.gridHeuristicDiagonal3D(a: Vector3, b: Vector3): number
	local delta = MathUtils.vector3Abs(a - b)
	return math.max(delta.X, delta.Y, delta.Z)
end

function MathUtils.gridCellCenterAABB(cell: Vector3, cellSize: number): (Vector3, Vector3)
	local center = MathUtils.gridCellToWorld3D(cell, cellSize)
	local half = Vector3.one * (math.max(cellSize, EPSILON) * 0.5)
	return center - half, center + half
end

function MathUtils.pathSmoothCorner(previous: Vector3, current: Vector3, nextPoint: Vector3, radius: number): (Vector3, Vector3)
	local inDir = MathUtils.safeUnit(previous - current, Vector3.zAxis)
	local outDir = MathUtils.safeUnit(nextPoint - current, Vector3.zAxis)
	local safeRadius = math.max(radius, 0)
	return current + inDir * safeRadius, current + outDir * safeRadius
end

function MathUtils.pathSegmentLength(points: { Vector3 }): number
	local total = 0
	for i = 2, #points do
		total += (points[i] - points[i - 1]).Magnitude
	end
	return total
end

function MathUtils.pathSampleLinear(points: { Vector3 }, alpha: number): Vector3
	if #points == 0 then
		return Vector3.zero
	elseif #points == 1 then
		return points[1]
	end
	local total = MathUtils.pathSegmentLength(points)
	local target = math.clamp(alpha, 0, 1) * total
	local walked = 0
	for i = 2, #points do
		local a = points[i - 1]
		local b = points[i]
		local length = (b - a).Magnitude
		if walked + length >= target then
			return a:Lerp(b, (target - walked) / math.max(length, EPSILON))
		end
		walked += length
	end
	return points[#points]
end

function MathUtils.pathClosestPointPolyline(point: Vector3, points: { Vector3 }): Vector3
	if #points == 0 then
		return point
	end
	local best = points[1]
	local bestDist = math.huge
	for i = 2, #points do
		local closest = MathUtils.closestPointOnSegment(point, points[i - 1], points[i])
		local dist = (point - closest).Magnitude
		if dist < bestDist then
			bestDist = dist
			best = closest
		end
	end
	return best
end

function MathUtils.pathSimplifyCollinear(points: { Vector3 }, tolerance: number?): { Vector3 }
	if #points <= 2 then
		return points
	end
	local result = { points[1] }
	local threshold = tolerance or 0.001
	for i = 2, #points - 1 do
		local a = MathUtils.safeUnit(points[i] - points[i - 1], Vector3.zAxis)
		local b = MathUtils.safeUnit(points[i + 1] - points[i], Vector3.zAxis)
		if (a - b).Magnitude > threshold then
			table.insert(result, points[i])
		end
	end
	table.insert(result, points[#points])
	return result
end

function MathUtils.colorMathLerp(a: Color3, b: Color3, alpha: number): Color3
	local t = math.clamp(alpha, 0, 1)
	return Color3.new(a.R + (b.R - a.R) * t, a.G + (b.G - a.G) * t, a.B + (b.B - a.B) * t)
end

function MathUtils.colorMathScale(color: Color3, scale: number): Color3
	return Color3.new(math.clamp(color.R * scale, 0, 1), math.clamp(color.G * scale, 0, 1), math.clamp(color.B * scale, 0, 1))
end

function MathUtils.colorMathAdd(a: Color3, b: Color3): Color3
	return Color3.new(math.clamp(a.R + b.R, 0, 1), math.clamp(a.G + b.G, 0, 1), math.clamp(a.B + b.B, 0, 1))
end

function MathUtils.colorMathMultiply(a: Color3, b: Color3): Color3
	return Color3.new(a.R * b.R, a.G * b.G, a.B * b.B)
end

function MathUtils.colorMathLuminance(color: Color3): number
	return color.R * 0.2126 + color.G * 0.7152 + color.B * 0.0722
end

function MathUtils.colorMathContrastText(color: Color3): Color3
	if MathUtils.colorMathLuminance(color) > 0.5 then
		return Color3.new(0, 0, 0)
	end
	return Color3.new(1, 1, 1)
end

function MathUtils.cframeWithoutPosition(cf: CFrame): CFrame
	return cf - cf.Position
end

function MathUtils.cframeWithPosition(cf: CFrame, position: Vector3): CFrame
	return CFrame.new(position) * (cf - cf.Position)
end

function MathUtils.cframeTransformPointArray(cf: CFrame, points: { Vector3 }): { Vector3 }
	local result = {}
	for i, point in ipairs(points) do
		result[i] = cf:PointToWorldSpace(point)
	end
	return result
end

function MathUtils.cframeInverseTransformPointArray(cf: CFrame, points: { Vector3 }): { Vector3 }
	local result = {}
	for i, point in ipairs(points) do
		result[i] = cf:PointToObjectSpace(point)
	end
	return result
end

function MathUtils.cframeLookAtFlat(position: Vector3, target: Vector3, fallbackForward: Vector3?): CFrame
	local delta = Vector3.new(target.X - position.X, 0, target.Z - position.Z)
	local forward = MathUtils.safeUnit(delta, fallbackForward or Vector3.new(0, 0, -1))
	return CFrame.lookAt(position, position + forward, Vector3.yAxis)
end

function MathUtils.cframeYawOnly(cf: CFrame): CFrame
	local forward = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
	if forward.Magnitude < EPSILON then
		return CFrame.new(cf.Position)
	end
	return CFrame.lookAt(cf.Position, cf.Position + forward.Unit, Vector3.yAxis)
end

function MathUtils.cframeBlendPositionRotation(a: CFrame, b: CFrame, positionAlpha: number, rotationAlpha: number): CFrame
	local pos = a.Position:Lerp(b.Position, math.clamp(positionAlpha, 0, 1))
	local rot = (a - a.Position):Lerp(b - b.Position, math.clamp(rotationAlpha, 0, 1))
	return CFrame.new(pos) * rot
end

function MathUtils.arrayAverageVector3(values: { Vector3 }): Vector3
	if #values == 0 then
		return Vector3.zero
	end
	local sum = Vector3.zero
	for _, value in ipairs(values) do
		sum += value
	end
	return sum / #values
end

function MathUtils.arrayAverageNumber(values: { number }): number
	if #values == 0 then
		return 0
	end
	local sum = 0
	for _, value in ipairs(values) do
		sum += value
	end
	return sum / #values
end

function MathUtils.arrayMinNumber(values: { number }, fallback: number?): number
	if #values == 0 then
		return fallback or 0
	end
	local result = values[1]
	for i = 2, #values do
		result = math.min(result, values[i])
	end
	return result
end

function MathUtils.arrayMaxNumber(values: { number }, fallback: number?): number
	if #values == 0 then
		return fallback or 0
	end
	local result = values[1]
	for i = 2, #values do
		result = math.max(result, values[i])
	end
	return result
end

function MathUtils.arrayBoundsVector3(values: { Vector3 }): (Vector3, Vector3)
	if #values == 0 then
		return Vector3.zero, Vector3.zero
	end
	local minPoint = values[1]
	local maxPoint = values[1]
	for i = 2, #values do
		local value = values[i]
		minPoint = Vector3.new(math.min(minPoint.X, value.X), math.min(minPoint.Y, value.Y), math.min(minPoint.Z, value.Z))
		maxPoint = Vector3.new(math.max(maxPoint.X, value.X), math.max(maxPoint.Y, value.Y), math.max(maxPoint.Z, value.Z))
	end
	return minPoint, maxPoint
end

function MathUtils.arrayWeightedAverageVector3(values: { Vector3 }, weights: { number }): Vector3
	local sum = Vector3.zero
	local total = 0
	for i, value in ipairs(values) do
		local weight = weights[i] or 0
		sum += value * weight
		total += weight
	end
	if math.abs(total) < EPSILON then
		return Vector3.zero
	end
	return sum / total
end

function MathUtils.arrayWeightedAverageNumber(values: { number }, weights: { number }): number
	local sum = 0
	local total = 0
	for i, value in ipairs(values) do
		local weight = weights[i] or 0
		sum += value * weight
		total += weight
	end
	if math.abs(total) < EPSILON then
		return 0
	end
	return sum / total
end

function MathUtils.randomUnitVector2(rng: Random?): Vector2
	local random = rng or Random.new()
	local angle = random:NextNumber(0, TWO_PI)
	return Vector2.new(math.cos(angle), math.sin(angle))
end

function MathUtils.randomUnitVector3(rng: Random?): Vector3
	local random = rng or Random.new()
	local z = random:NextNumber(-1, 1)
	local angle = random:NextNumber(0, TWO_PI)
	local radius = math.sqrt(math.max(1 - z * z, 0))
	return Vector3.new(math.cos(angle) * radius, z, math.sin(angle) * radius)
end

function MathUtils.randomPointInSphere(radius: number, rng: Random?): Vector3
	local random = rng or Random.new()
	local direction = MathUtils.randomUnitVector3(random)
	local distance = radius * (random:NextNumber() ^ (1 / 3))
	return direction * distance
end

function MathUtils.randomPointInCircle(radius: number, rng: Random?): Vector2
	local random = rng or Random.new()
	local direction = MathUtils.randomUnitVector2(random)
	local distance = radius * math.sqrt(random:NextNumber())
	return direction * distance
end

function MathUtils.noise01(x: number, y: number?, z: number?): number
	return math.clamp(math.noise(x, y or 0, z or 0) * 0.5 + 0.5, 0, 1)
end

function MathUtils.noiseSigned(x: number, y: number?, z: number?): number
	return math.clamp(math.noise(x, y or 0, z or 0), -1, 1)
end

function MathUtils.fbmNoise3D(seed: number, t: number, octaves: number): number
	local sum = 0
	local amp = 1
	local freq = 1
	local maxSum = 0
	for i = 1, octaves do
		sum += math.noise(seed + i * 0.137, t * freq, 0) * amp
		maxSum += amp
		amp *= 0.5
		freq *= 2
	end
	return sum / maxSum
end

function MathUtils.noiseVector3(seed: number, time: number, frequency: number): Vector3
	local t = time * frequency
	local octaves = 3
	return Vector3.new(
		MathUtils.fbmNoise3D(seed, t, octaves),
		MathUtils.fbmNoise3D(seed + 1, t, octaves),
		MathUtils.fbmNoise3D(seed + 2, t, octaves)
	)
end

function MathUtils.noiseVector2(seed: number, time: number, frequency: number): Vector2
	local t = time * frequency
	return Vector2.new(math.noise(seed, t, 0), math.noise(0, seed, t))
end

local function cameraDampScalar(current: number, target: number, velocity: number, smoothTime: number, dt: number): (number, number)
	smoothTime = math.max(EPSILON, smoothTime)
	local omega = 2 / smoothTime
	local x = omega * dt
	local exp = 1 / (1 + x + 0.48 * x * x + 0.235 * x * x * x)
	local change = current - target
	local temp = (velocity + omega * change) * dt
	local nextVelocity = (velocity - omega * temp) * exp
	local nextValue = target + (change + temp) * exp
	return nextValue, nextVelocity
end

local function cameraDampVector3(current: Vector3, target: Vector3, velocity: Vector3, smoothTime: number, dt: number): (Vector3, Vector3)
	local x, vx = cameraDampScalar(current.X, target.X, velocity.X, smoothTime, dt)
	local y, vy = cameraDampScalar(current.Y, target.Y, velocity.Y, smoothTime, dt)
	local z, vz = cameraDampScalar(current.Z, target.Z, velocity.Z, smoothTime, dt)
	return Vector3.new(x, y, z), Vector3.new(vx, vy, vz)
end

local function cameraClampDistance(distance: number, minDistance: number?, maxDistance: number?): number
	local minValue = minDistance or 0
	local maxValue = maxDistance or MathUtils.FLOAT_MAX
	return math.clamp(distance, minValue, math.max(minValue, maxValue))
end

function MathUtils.cameraClampPitch(pitch: number, minPitch: number?, maxPitch: number?): number
	local minValue = minPitch or math.rad(-85)
	local maxValue = maxPitch or math.rad(85)
	return math.clamp(pitch, minValue, maxValue)
end

function MathUtils.cameraNormalizeYaw(yaw: number): number
	return MathUtils.normalizeAngle(yaw)
end

local function collisionClosestPointTriangleInternal(point: Vector3, a: Vector3, b: Vector3, c: Vector3): Vector3
	local ab = b - a
	local ac = c - a
	local ap = point - a
	local d1 = ab:Dot(ap)
	local d2 = ac:Dot(ap)
	if d1 <= 0 and d2 <= 0 then
		return a
	end
	local bp = point - b
	local d3 = ab:Dot(bp)
	local d4 = ac:Dot(bp)
	if d3 >= 0 and d4 <= d3 then
		return b
	end
	local vc = d1 * d4 - d3 * d2
	if vc <= 0 and d1 >= 0 and d3 <= 0 then
		local v = d1 / (d1 - d3)
		return a + ab * v
	end
	local cp = point - c
	local d5 = ab:Dot(cp)
	local d6 = ac:Dot(cp)
	if d6 >= 0 and d5 <= d6 then
		return c
	end
	local vb = d5 * d2 - d1 * d6
	if vb <= 0 and d2 >= 0 and d6 <= 0 then
		local w = d2 / (d2 - d6)
		return a + ac * w
	end
	local va = d3 * d6 - d5 * d4
	if va <= 0 and (d4 - d3) >= 0 and (d5 - d6) >= 0 then
		local w = (d4 - d3) / ((d4 - d3) + (d5 - d6))
		return b + (c - b) * w
	end
	local denom = 1 / math.max(va + vb + vc, EPSILON)
	local v = vb * denom
	local w = vc * denom
	return a + ab * v + ac * w
end

function MathUtils.collisionClosestPointOnTriangle(point: Vector3, a: Vector3, b: Vector3, c: Vector3): Vector3
	return collisionClosestPointTriangleInternal(point, a, b, c)
end

function MathUtils.collisionPointTriangleDistance(point: Vector3, a: Vector3, b: Vector3, c: Vector3): (number, Vector3)
	local closest = collisionClosestPointTriangleInternal(point, a, b, c)
	return (point - closest).Magnitude, closest
end

function MathUtils.collisionSphereSphere(centerA: Vector3, radiusA: number, centerB: Vector3, radiusB: number): (boolean, Vector3, number)
	local delta = centerB - centerA
	local distance = delta.Magnitude
	local radius = radiusA + radiusB
	if distance > radius then
		return false, if distance > EPSILON then delta / distance else Vector3.yAxis, 0
	end
	local normal = if distance > EPSILON then delta / distance else Vector3.yAxis
	return true, normal, radius - distance
end

function MathUtils.collisionSphereAABB(center: Vector3, radius: number, minPoint: Vector3, maxPoint: Vector3): (boolean, Vector3, number, Vector3)
	local closest = MathUtils.closestPointOnAABB(center, minPoint, maxPoint)
	local delta = center - closest
	local distSq = delta:Dot(delta)
	if distSq > radius * radius then
		return false, Vector3.yAxis, 0, closest
	end
	if distSq > EPSILON then
		local dist = math.sqrt(distSq)
		return true, delta / dist, radius - dist, closest
	end
	local toMin = center - minPoint
	local toMax = maxPoint - center
	local minAxis = math.min(toMin.X, toMax.X, toMin.Y, toMax.Y, toMin.Z, toMax.Z)
	if minAxis == toMin.X then
		return true, Vector3.new(-1, 0, 0), radius + toMin.X, Vector3.new(minPoint.X, center.Y, center.Z)
	elseif minAxis == toMax.X then
		return true, Vector3.new(1, 0, 0), radius + toMax.X, Vector3.new(maxPoint.X, center.Y, center.Z)
	elseif minAxis == toMin.Y then
		return true, Vector3.new(0, -1, 0), radius + toMin.Y, Vector3.new(center.X, minPoint.Y, center.Z)
	elseif minAxis == toMax.Y then
		return true, Vector3.new(0, 1, 0), radius + toMax.Y, Vector3.new(center.X, maxPoint.Y, center.Z)
	elseif minAxis == toMin.Z then
		return true, Vector3.new(0, 0, -1), radius + toMin.Z, Vector3.new(center.X, center.Y, minPoint.Z)
	end
	return true, Vector3.new(0, 0, 1), radius + toMax.Z, Vector3.new(center.X, center.Y, maxPoint.Z)
end

function MathUtils.collisionSphereOBB(center: Vector3, radius: number, boxCFrame: CFrame, halfExtents: Vector3): (boolean, Vector3, number, Vector3)
	local right = boxCFrame.RightVector
	local up = boxCFrame.UpVector
	local look = boxCFrame.LookVector
	local pos = boxCFrame.Position

	local offset = center - pos
	local localCenter = Vector3.new(offset:Dot(right), offset:Dot(up), offset:Dot(look))
	local localClosest = Vector3.new(
		math.clamp(localCenter.X, -halfExtents.X, halfExtents.X),
		math.clamp(localCenter.Y, -halfExtents.Y, halfExtents.Y),
		math.clamp(localCenter.Z, -halfExtents.Z, halfExtents.Z)
	)
	local closest = pos + right * localClosest.X + up * localClosest.Y + look * localClosest.Z
	local delta = center - closest
	local distSq = delta:Dot(delta)
	if distSq > radius * radius then
		return false, Vector3.yAxis, 0, closest
	end
	if distSq > EPSILON then
		local dist = math.sqrt(distSq)
		return true, delta / dist, radius - dist, closest
	end
	local axis = Vector3.xAxis
	local penetration = halfExtents.X - math.abs(localCenter.X)
	local yPenetration = halfExtents.Y - math.abs(localCenter.Y)
	local zPenetration = halfExtents.Z - math.abs(localCenter.Z)
	if yPenetration < penetration then
		axis = Vector3.yAxis
		penetration = yPenetration
	end
	if zPenetration < penetration then
		axis = Vector3.zAxis
		penetration = zPenetration
	end
	local localNormal = axis * MathUtils.signNonZero(localCenter:Dot(axis))
	local normal = right * localNormal.X + up * localNormal.Y + look * localNormal.Z
	return true, normal, radius + penetration, center - normal * radius
end

function MathUtils.collisionCapsuleSphere(a: Vector3, b: Vector3, capsuleRadius: number, sphereCenter: Vector3, sphereRadius: number): (boolean, Vector3, number, Vector3)
	local closest = MathUtils.closestPointOnSegment(sphereCenter, a, b)
	local hit, normal, depth = MathUtils.collisionSphereSphere(closest, capsuleRadius, sphereCenter, sphereRadius)
	return hit, normal, depth, closest
end

function MathUtils.collisionCapsuleCapsule(a0: Vector3, a1: Vector3, radiusA: number, b0: Vector3, b1: Vector3, radiusB: number): (boolean, Vector3, number, Vector3, Vector3)
	local pA, pB = MathUtils.closestPointsOnSegments(a0, a1, b0, b1)
	local hit, normal, depth = MathUtils.collisionSphereSphere(pA, radiusA, pB, radiusB)
	return hit, normal, depth, pA, pB
end

function MathUtils.collisionAABBOverlapDetailed(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): (boolean, Vector3, number)
	local overlapX = math.min(maxA.X, maxB.X) - math.max(minA.X, minB.X)
	local overlapY = math.min(maxA.Y, maxB.Y) - math.max(minA.Y, minB.Y)
	local overlapZ = math.min(maxA.Z, maxB.Z) - math.max(minA.Z, minB.Z)
	if overlapX < 0 or overlapY < 0 or overlapZ < 0 then
		return false, Vector3.zero, 0
	end
	local centerA = (minA + maxA) * 0.5
	local centerB = (minB + maxB) * 0.5
	local depth = overlapX
	local normal = Vector3.new(MathUtils.signNonZero(centerA.X - centerB.X), 0, 0)
	local bestDiff = math.abs(centerA.X - centerB.X)

	local yDiff = math.abs(centerA.Y - centerB.Y)
	if overlapY < depth or (overlapY == depth and yDiff > bestDiff) then
		depth = overlapY
		normal = Vector3.new(0, MathUtils.signNonZero(centerA.Y - centerB.Y), 0)
		bestDiff = yDiff
	end

	local zDiff = math.abs(centerA.Z - centerB.Z)
	if overlapZ < depth or (overlapZ == depth and zDiff > bestDiff) then
		depth = overlapZ
		normal = Vector3.new(0, 0, MathUtils.signNonZero(centerA.Z - centerB.Z))
	end
	return true, normal, depth
end

function MathUtils.collisionAABBPenetrationVector(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): Vector3
	local hit, normal, depth = MathUtils.collisionAABBOverlapDetailed(minA, maxA, minB, maxB)
	if not hit then
		return Vector3.zero
	end
	return normal * depth
end

function MathUtils.collisionSpherePlaneContact(center: Vector3, radius: number, planeNormal: Vector3, planeD: number): (boolean, Vector3, number, Vector3)
	local n = MathUtils.safeUnit(planeNormal, Vector3.yAxis)
	local distance = n:Dot(center) + planeD
	local penetration = radius - distance
	if penetration < 0 then
		return false, n, 0, center - n * radius
	end
	return true, n, penetration, center - n * radius
end

function MathUtils.collisionCapsulePlaneContact(a: Vector3, b: Vector3, radius: number, planeNormal: Vector3, planeD: number): (boolean, Vector3, number, Vector3)
	local n = MathUtils.safeUnit(planeNormal, Vector3.yAxis)
	local da = n:Dot(a) + planeD
	local db = n:Dot(b) + planeD
	local endpoint = if da < db then a else b
	local distance = math.min(da, db)
	local penetration = radius - distance
	if penetration < 0 then
		return false, n, 0, endpoint - n * radius
	end
	return true, n, penetration, endpoint - n * radius
end

function MathUtils.collisionRayAABBInterval(origin: Vector3, direction: Vector3, minPoint: Vector3, maxPoint: Vector3): (boolean, number, number)
	local tMin = -MathUtils.FLOAT_MAX
	local tMax = MathUtils.FLOAT_MAX
	local function testAxis(originAxis: number, directionAxis: number, minAxis: number, maxAxis: number): boolean
		if math.abs(directionAxis) < EPSILON then
			return originAxis >= minAxis and originAxis <= maxAxis
		end
		local inv = 1 / directionAxis
		local t1 = (minAxis - originAxis) * inv
		local t2 = (maxAxis - originAxis) * inv
		if t1 > t2 then
			t1, t2 = t2, t1
		end
		tMin = math.max(tMin, t1)
		tMax = math.min(tMax, t2)
		return tMin <= tMax
	end
	if not testAxis(origin.X, direction.X, minPoint.X, maxPoint.X) then
		return false, 0, 0
	end
	if not testAxis(origin.Y, direction.Y, minPoint.Y, maxPoint.Y) then
		return false, 0, 0
	end
	if not testAxis(origin.Z, direction.Z, minPoint.Z, maxPoint.Z) then
		return false, 0, 0
	end
	return true, tMin, tMax
end

function MathUtils.collisionRaySphereDetailed(origin: Vector3, direction: Vector3, center: Vector3, radius: number): (boolean, number?, number?)
	local dir = MathUtils.safeUnit(direction, Vector3.zAxis)
	local m = origin - center
	local b = m:Dot(dir)
	local c = m:Dot(m) - radius * radius
	if c > 0 and b > 0 then
		return false, nil, nil
	end
	local discr = b * b - c
	if discr < 0 then
		return false, nil, nil
	end
	local root = math.sqrt(discr)
	local t0 = -b - root
	local t1 = -b + root
	return true, math.max(0, t0), math.max(0, t1)
end

function MathUtils.collisionSegmentSphere(a: Vector3, b: Vector3, center: Vector3, radius: number): (boolean, number, Vector3)
	local closest, t = MathUtils.closestPointOnSegment(center, a, b)
	local delta = center - closest
	if delta:Dot(delta) > radius * radius then
		return false, t, closest
	end
	return true, t, closest
end

function MathUtils.collisionSegmentAABB(a: Vector3, b: Vector3, minPoint: Vector3, maxPoint: Vector3): (boolean, number, number)
	local direction = b - a
	local hit, t0, t1 = MathUtils.collisionRayAABBInterval(a, direction, minPoint, maxPoint)
	if not hit then
		return false, t0, t1
	end
	if t1 < 0 or t0 > 1 then
		return false, t0, t1
	end
	return true, math.clamp(t0, 0, 1), math.clamp(t1, 0, 1)
end

function MathUtils.collisionSweptSpherePlane(center: Vector3, radius: number, velocity: Vector3, planeNormal: Vector3, planeD: number, dt: number): (boolean, number, Vector3)
	local n = MathUtils.safeUnit(planeNormal, Vector3.yAxis)
	local distance = n:Dot(center) + planeD - radius
	if distance <= 0 then
		return true, 0, center
	end
	local speed = n:Dot(velocity)
	if speed >= -EPSILON then
		return false, dt, center + velocity * dt
	end
	local time = distance / -speed
	if time > dt then
		return false, dt, center + velocity * dt
	end
	return true, time, center + velocity * time
end

function MathUtils.collisionSweptSphereSphere(centerA: Vector3, radiusA: number, velocityA: Vector3, centerB: Vector3, radiusB: number, velocityB: Vector3, dt: number): (boolean, number, Vector3)
	local relativePosition = centerA - centerB
	local relativeVelocity = velocityA - velocityB
	local radius = radiusA + radiusB
	local a = relativeVelocity:Dot(relativeVelocity)
	local b = 2 * relativePosition:Dot(relativeVelocity)
	local c = relativePosition:Dot(relativePosition) - radius * radius
	if c <= 0 then
		return true, 0, centerA
	end
	if a <= 0 then
		return false, dt, centerA + velocityA * dt
	end
	local roots = MathUtils.solveQuadratic(a, b, c)
	if not roots then
		return false, dt, centerA + velocityA * dt
	end
	local hitTime = MathUtils.FLOAT_MAX
	for _, root in ipairs(roots) do
		if root >= 0 and root <= dt then
			hitTime = math.min(hitTime, root)
		end
	end
	if hitTime == MathUtils.FLOAT_MAX then
		return false, dt, centerA + velocityA * dt
	end
	return true, hitTime, centerA + velocityA * hitTime
end

function MathUtils.collisionExpandedAABBForSphere(minPoint: Vector3, maxPoint: Vector3, radius: number): (Vector3, Vector3)
	local r = Vector3.new(radius, radius, radius)
	return minPoint - r, maxPoint + r
end

function MathUtils.collisionMinkowskiAABB(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): (Vector3, Vector3)
	return minA - maxB, maxA - minB
end

function MathUtils.collisionResolveSphereAABB(center: Vector3, radius: number, minPoint: Vector3, maxPoint: Vector3, slop: number?): (Vector3, Vector3, number)
	local hit, normal, depth = MathUtils.collisionSphereAABB(center, radius, minPoint, maxPoint)
	if not hit then
		return center, normal, 0
	end
	local correction = math.max(depth - (slop or 0), 0)
	return center + normal * correction, normal, depth
end

function MathUtils.collisionResolveSphereOBB(center: Vector3, radius: number, boxCFrame: CFrame, halfExtents: Vector3, slop: number?): (Vector3, Vector3, number)
	local hit, normal, depth = MathUtils.collisionSphereOBB(center, radius, boxCFrame, halfExtents)
	if not hit then
		return center, normal, 0
	end
	local correction = math.max(depth - (slop or 0), 0)
	return center + normal * correction, normal, depth
end

function MathUtils.collisionClipVelocity(velocity: Vector3, normal: Vector3, overbounce: number?): Vector3
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	local backoff = velocity:Dot(n) * (overbounce or 1)
	if backoff < 0 then
		return velocity - n * backoff
	end
	return velocity
end

function MathUtils.collisionSlideVelocity(velocity: Vector3, normal: Vector3): Vector3
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	return velocity - n * velocity:Dot(n)
end

function MathUtils.collisionProjectOntoWalkablePlane(velocity: Vector3, groundNormal: Vector3, maxSlopeRadians: number): Vector3
	local n = MathUtils.safeUnit(groundNormal, Vector3.yAxis)
	if n:Dot(Vector3.yAxis) < math.cos(maxSlopeRadians) then
		return velocity
	end
	return MathUtils.collisionSlideVelocity(velocity, n)
end

function MathUtils.collisionIsWalkableNormal(normal: Vector3, maxSlopeRadians: number): boolean
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	return n:Dot(Vector3.yAxis) >= math.cos(maxSlopeRadians)
end

function MathUtils.collisionGroundSnap(position: Vector3, velocity: Vector3, groundPoint: Vector3, groundNormal: Vector3, snapDistance: number, maxSlopeRadians: number): (boolean, Vector3, Vector3)
	local n = MathUtils.safeUnit(groundNormal, Vector3.yAxis)
	local distance = n:Dot(position - groundPoint)
	if distance < 0 or distance > snapDistance then
		return false, position, velocity
	end
	if not MathUtils.collisionIsWalkableNormal(n, maxSlopeRadians) then
		return false, position, velocity
	end
	local snappedPosition = position - n * distance
	local snappedVelocity = MathUtils.collisionSlideVelocity(velocity, n)
	return true, snappedPosition, snappedVelocity
end

function MathUtils.collisionContactCFrame(point: Vector3, normal: Vector3, tangentHint: Vector3?): CFrame
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	local tangent = tangentHint or Vector3.xAxis
	tangent = tangent - n * tangent:Dot(n)
	if tangent.Magnitude < EPSILON then
		local basisTangent, _ = MathUtils.orthonormalBasisFromNormal(n)
		tangent = basisTangent
	else
		tangent = tangent.Unit
	end
	local bitangent = n:Cross(tangent).Unit
	return CFrame.fromMatrix(point, tangent, n, -bitangent)
end

function MathUtils.collisionAverageNormals(normals: { Vector3 }, fallback: Vector3?): Vector3
	local sum = Vector3.zero
	for _, normal in ipairs(normals) do
		sum += MathUtils.safeUnit(normal, Vector3.zero)
	end
	return MathUtils.safeUnit(sum, fallback or Vector3.yAxis)
end

function MathUtils.collisionSortContactsByDepth(contacts: { Contact }): { Contact }
	local function getDepth(contact: Contact): number
		local depth = contact.depth
		if depth == nil then
			return 0
		end
		return depth
	end
	table.sort(contacts, function(a: Contact, b: Contact)
		return getDepth(a) > getDepth(b)
	end)
	return contacts
end

function MathUtils.cameraResolveObstruction(desiredPosition: Vector3, focusPoint: Vector3, hitPosition: Vector3, hitNormal: Vector3, radius: number, padding: number?): Vector3
	local n = MathUtils.safeUnit(hitNormal, Vector3.yAxis)
	local safePadding = padding or 0.05
	local pushed = hitPosition + n * (radius + safePadding)
	local focusToDesired = desiredPosition - focusPoint
	local focusToPushed = pushed - focusPoint
	if focusToPushed:Dot(focusToDesired) <= 0 then
		return focusPoint
	end
	if focusToPushed.Magnitude > focusToDesired.Magnitude then
		return desiredPosition
	end
	return pushed
end

function MathUtils.cameraBoomCollisionCFrame(focusPoint: Vector3, desiredPosition: Vector3, resolvedPosition: Vector3, up: Vector3?): CFrame
	local safeUp = MathUtils.safeUnit(up or Vector3.yAxis, Vector3.yAxis)
	if (focusPoint - resolvedPosition).Magnitude < EPSILON then
		resolvedPosition = focusPoint - Vector3.zAxis * EPSILON
	end
	return CFrame.lookAt(resolvedPosition, focusPoint, safeUp)
end

function MathUtils.cameraClipNearPlane(cameraCFrame: CFrame, nearDistance: number, halfExtents: Vector2): { Vector3 }
	local center = cameraCFrame.Position + cameraCFrame.LookVector * nearDistance
	local right = cameraCFrame.RightVector * halfExtents.X
	local up = cameraCFrame.UpVector * halfExtents.Y
	return {
		center - right - up,
		center + right - up,
		center + right + up,
		center - right + up,
	}
end

function MathUtils.cameraSmoothObstructionDistance(currentDistance: number, targetDistance: number, velocity: number, retractSmoothTime: number, expandSmoothTime: number, dt: number): (number, number)
	local smoothTime = if targetDistance < currentDistance then retractSmoothTime else expandSmoothTime
	return cameraDampScalar(currentDistance, targetDistance, velocity, smoothTime, dt)
end

function MathUtils.cameraCalculateCollisionProbeRadius(verticalFovRadians: number, nearDistance: number, aspect: number, minRadius: number?): number
	local extents = MathUtils.cameraViewportHalfExtentsAtDistance(nearDistance, verticalFovRadians, aspect)
	return math.max(minRadius or 0, math.sqrt(extents.X * extents.X + extents.Y * extents.Y))
end

function MathUtils.cameraShortestYawDelta(currentYaw: number, targetYaw: number): number
	return MathUtils.angleDifference(currentYaw, targetYaw)
end

function MathUtils.cameraYawFromDirection(direction: Vector3): number
	local dir = MathUtils.safeUnit(Vector3.new(direction.X, 0, direction.Z), Vector3.new(0, 0, -1))
	return math.atan2(-dir.X, -dir.Z)
end

function MathUtils.cameraPitchFromDirection(direction: Vector3): number
	local dir = MathUtils.safeUnit(direction, Vector3.new(0, 0, -1))
	return math.asin(math.clamp(dir.Y, -1, 1))
end

function MathUtils.cameraYawPitchFromDirection(direction: Vector3): (number, number)
	return MathUtils.cameraYawFromDirection(direction), MathUtils.cameraPitchFromDirection(direction)
end

function MathUtils.cameraDirectionFromYawPitch(yaw: number, pitch: number): Vector3
	local cp = math.cos(pitch)
	return Vector3.new(-math.sin(yaw) * cp, math.sin(pitch), -math.cos(yaw) * cp)
end

function MathUtils.cameraCFrameFromYawPitch(position: Vector3, yaw: number, pitch: number, roll: number?): CFrame
	local direction = MathUtils.cameraDirectionFromYawPitch(yaw, pitch)
	local cf = CFrame.lookAt(position, position + direction, Vector3.yAxis)
	if roll and math.abs(roll) > EPSILON then
		cf *= CFrame.Angles(0, 0, roll)
	end
	return cf
end

function MathUtils.cameraOrbitPosition(target: Vector3, yaw: number, pitch: number, distance: number, minDistance: number?, maxDistance: number?): Vector3
	local d = cameraClampDistance(distance, minDistance, maxDistance)
	local direction = MathUtils.cameraDirectionFromYawPitch(yaw, MathUtils.cameraClampPitch(pitch))
	return target - direction * d
end

function MathUtils.cameraOrbitCFrame(target: Vector3, yaw: number, pitch: number, distance: number, minDistance: number?, maxDistance: number?): CFrame
	local position = MathUtils.cameraOrbitPosition(target, yaw, pitch, distance, minDistance, maxDistance)
	return CFrame.lookAt(position, target, Vector3.yAxis)
end

function MathUtils.cameraFollowCFrame(targetCFrame: CFrame, localOffset: Vector3, focusOffset: Vector3?): CFrame
	local position = targetCFrame:PointToWorldSpace(localOffset)
	local focus = targetCFrame:PointToWorldSpace(focusOffset or Vector3.zero)
	return CFrame.lookAt(position, focus, Vector3.yAxis)
end

function MathUtils.cameraFrameBoundsDistance(boundsSize: Vector3, verticalFovRadians: number, aspect: number, padding: number?): number
	local pad = padding or 1
	local safeAspect = math.max(aspect, EPSILON)
	local halfHeight = math.max(boundsSize.Y, EPSILON) * 0.5 * pad
	local halfWidth = math.max(boundsSize.X, EPSILON) * 0.5 * pad
	local halfDepth = math.max(boundsSize.Z, 0) * 0.5 * pad
	local tanY = math.tan(math.max(verticalFovRadians, EPSILON) * 0.5)
	local tanX = tanY * safeAspect
	local distY = halfHeight / math.max(tanY, EPSILON)
	local distX = halfWidth / math.max(tanX, EPSILON)
	return math.max(distX, distY) + halfDepth
end

function MathUtils.cameraFitAABB(minPoint: Vector3, maxPoint: Vector3, direction: Vector3, verticalFovRadians: number, aspect: number, padding: number?): CFrame
	local center = (minPoint + maxPoint) * 0.5
	local size = maxPoint - minPoint
	local dist = MathUtils.cameraFrameBoundsDistance(size, verticalFovRadians, aspect, padding)
	local dir = MathUtils.safeUnit(direction, Vector3.new(0, 0, -1))
	local position = center - dir * dist
	return CFrame.lookAt(position, center, Vector3.yAxis)
end

function MathUtils.cameraViewportHalfExtentsAtDistance(distance: number, verticalFovRadians: number, aspect: number): Vector2
	local halfHeight = math.tan(verticalFovRadians * 0.5) * math.max(distance, 0)
	return Vector2.new(halfHeight * math.max(aspect, EPSILON), halfHeight)
end

function MathUtils.cameraDeadZoneOffset(screenOffset: Vector2, deadZone: Vector2, maxOffset: Vector2): Vector2
	local x = 0
	local y = 0
	local absX = math.abs(screenOffset.X)
	local absY = math.abs(screenOffset.Y)
	if absX > deadZone.X then
		x = MathUtils.sign(screenOffset.X) * math.min(absX - deadZone.X, maxOffset.X)
	end
	if absY > deadZone.Y then
		y = MathUtils.sign(screenOffset.Y) * math.min(absY - deadZone.Y, maxOffset.Y)
	end
	return Vector2.new(x, y)
end

function MathUtils.cameraCriticallyDampedPosition(current: Vector3, target: Vector3, velocity: Vector3, smoothTime: number, dt: number): (Vector3, Vector3)
	return cameraDampVector3(current, target, velocity, smoothTime, dt)
end

function MathUtils.cameraCriticallyDampedAngle(current: number, target: number, velocity: number, smoothTime: number, dt: number): (number, number)
	local delta = MathUtils.angleDifference(current, target)
	local adjustedTarget = current + delta
	local nextValue, nextVelocity = cameraDampScalar(current, adjustedTarget, velocity, smoothTime, dt)
	return MathUtils.normalizeAngle(nextValue), nextVelocity
end

function MathUtils.cameraCriticallyDampedYawPitch(currentYaw: number, currentPitch: number, targetYaw: number, targetPitch: number, yawVelocity: number, pitchVelocity: number, smoothTime: number, dt: number): (number, number, number, number)
	local nextYaw, nextYawVelocity = MathUtils.cameraCriticallyDampedAngle(currentYaw, targetYaw, yawVelocity, smoothTime, dt)
	local nextPitch, nextPitchVelocity = cameraDampScalar(currentPitch, targetPitch, pitchVelocity, smoothTime, dt)
	return nextYaw, MathUtils.cameraClampPitch(nextPitch), nextYawVelocity, nextPitchVelocity
end

function MathUtils.cameraSmoothCFrame(current: CFrame, target: CFrame, positionSmoothTime: number, rotationAlpha: number, velocity: Vector3, dt: number): (CFrame, Vector3)
	local nextPosition, nextVelocity = cameraDampVector3(current.Position, target.Position, velocity, positionSmoothTime, dt)
	local alpha = MathUtils.saturate(rotationAlpha)
	local rotation = (current - current.Position):Lerp(target - target.Position, alpha)
	return CFrame.new(nextPosition) * rotation, nextVelocity
end

function MathUtils.cameraLookAheadTarget(position: Vector3, velocity: Vector3, leadTime: number, maxLeadDistance: number): Vector3
	local lead = velocity * math.max(leadTime, 0)
	local mag = lead.Magnitude
	if mag > maxLeadDistance and mag > EPSILON then
		lead = lead / mag * maxLeadDistance
	end
	return position + lead
end

function MathUtils.cameraShoulderPosition(targetCFrame: CFrame, shoulderOffset: number, verticalOffset: number, backDistance: number): Vector3
	return targetCFrame.Position + targetCFrame.RightVector * shoulderOffset + Vector3.yAxis * verticalOffset - targetCFrame.LookVector * backDistance
end

function MathUtils.cameraOverShoulderCFrame(targetCFrame: CFrame, shoulderOffset: number, verticalOffset: number, backDistance: number, focusDistance: number): CFrame
	local position = MathUtils.cameraShoulderPosition(targetCFrame, shoulderOffset, verticalOffset, backDistance)
	local focus = targetCFrame.Position + Vector3.yAxis * verticalOffset + targetCFrame.LookVector * focusDistance
	return CFrame.lookAt(position, focus, Vector3.yAxis)
end

function MathUtils.cameraApplyRoll(cameraCFrame: CFrame, roll: number): CFrame
	return cameraCFrame * CFrame.Angles(0, 0, roll)
end

function MathUtils.cameraLocalPan(cameraCFrame: CFrame, pan: Vector2, distance: number, verticalFovRadians: number, aspect: number): Vector3
	local extents = MathUtils.cameraViewportHalfExtentsAtDistance(distance, verticalFovRadians, aspect)
	return cameraCFrame.RightVector * (pan.X * extents.X) + cameraCFrame.UpVector * (pan.Y * extents.Y)
end

function MathUtils.cameraScreenShakeOffset(seed: number, time: number, amplitude: Vector3, frequency: number): Vector3
	local t = time * frequency
	local x = math.noise(seed, t, 0) * amplitude.X
	local y = math.noise(seed, 0, t) * amplitude.Y
	local z = math.noise(0, seed, t) * amplitude.Z
	return Vector3.new(x, y, z)
end

function MathUtils.cameraFovForHeight(height: number, distance: number): number
	return 2 * math.atan(math.max(height, EPSILON) * 0.5 / math.max(distance, EPSILON))
end

function MathUtils.cameraDollyDistanceForFov(height: number, verticalFovRadians: number): number
	return math.max(height, EPSILON) * 0.5 / math.max(math.tan(verticalFovRadians * 0.5), EPSILON)
end

function MathUtils.cameraRayDirectionFromViewportUnit(cameraCFrame: CFrame, unitPoint: Vector2, verticalFovRadians: number, aspect: number): Vector3
	local tanY = math.tan(verticalFovRadians * 0.5)
	local x = (unitPoint.X * 2 - 1) * tanY * aspect
	local y = (1 - unitPoint.Y * 2) * tanY
	local localDirection = MathUtils.safeUnit(Vector3.new(x, y, -1), Vector3.new(0, 0, -1))
	return cameraCFrame:VectorToWorldSpace(localDirection)
end

function MathUtils.remap(
	value: number,
	low1: number, high1: number,
	low2: number, high2: number
): number
	if math.abs(high1 - low1) < EPSILON then
		return low2
	end
	return low2 + (value - low1) * (high2 - low2) / (high1 - low1)
end

function MathUtils.clamp(value: number, min: number, max: number): number
	return value < min and min or value > max and max or value
end

function MathUtils.lerp(a: number, b: number, t: number): number
	return a + (b - a) * t
end

function MathUtils.inverseLerp(a: number, b: number, value: number): number
	if math.abs(b - a) < EPSILON then
		return 0
	end
	return (value - a) / (b - a)
end

function MathUtils.pingPong(t: number, length: number): number
	t = t % (length * 2)
	return t > length and length * 2 - t or t
end

function MathUtils.repeatValue(t: number, length: number): number
	return t - math.floor(t / length) * length
end

function MathUtils.deltaAngle(current: number, target: number): number
	return MathUtils.angleDifference(target, current)
end

function MathUtils.moveTowards(current: number, target: number, maxDelta: number): number
	local diff = target - current
	if math.abs(diff) <= maxDelta then
		return target
	end
	return current + (diff > 0 and maxDelta or -maxDelta)
end

function MathUtils.moveTowardsAngle(current: number, target: number, maxDelta: number): number
	local diff = MathUtils.angleDifference(target, current)
	if math.abs(diff) <= maxDelta then
		return target
	end
	return MathUtils.normalizeAngle(current + (diff > 0 and maxDelta or -maxDelta))
end

function MathUtils.sign(x: number): number
	return math.sign(x)
end

function MathUtils.round(value: number, decimals: number?): number
	if not decimals then
		return math.round(value)
	end
	local mult = 10 ^ decimals
	return math.floor(value * mult + 0.5) / mult
end

function MathUtils.randomInRange(min: number, max: number): number
	return min + math.random() * (max - min)
end

function MathUtils.randomIntInRange(min: number, max: number): number
	return math.random(min, max)
end

function MathUtils.randomVector(scale: number): Vector3
	return Vector3.new(
		(math.random() * 2 - 1) * scale,
		(math.random() * 2 - 1) * scale,
		(math.random() * 2 - 1) * scale
	)
end

function MathUtils.randomUnitVector(): Vector3
	local theta = math.random() * TWO_PI
	local phi = math.acos(2 * math.random() - 1)
	local sinPhi = math.sin(phi)
	return Vector3.new(
		sinPhi * math.cos(theta),
		sinPhi * math.sin(theta),
		math.cos(phi)
	)
end

function MathUtils.randomRotation(): (number, number, number, number)
	local u1, u2, u3 = math.random(), math.random(), math.random()
	local x = math.sqrt(1 - u1) * math.sin(TWO_PI * u2)
	local y = math.sqrt(1 - u1) * math.cos(TWO_PI * u2)
	local z = math.sqrt(u1) * math.sin(TWO_PI * u3)
	local w = math.sqrt(u1) * math.cos(TWO_PI * u3)
	return x, y, z, w
end

function MathUtils.projectPointOnLine(
	px: number, py: number, pz: number,
	lx: number, ly: number, lz: number,
	dx: number, dy: number, dz: number
): (number, number, number, number)
	local dirLenSq = dx * dx + dy * dy + dz * dz
	if dirLenSq < EPSILON then
		return lx, ly, lz, 0
	end
	local vx, vy, vz = px - lx, py - ly, pz - lz
	local t = (vx * dx + vy * dy + vz * dz) / dirLenSq
	return lx + dx * t, ly + dy * t, lz + dz * t, t
end

function MathUtils.distanceToLine(
	px: number, py: number, pz: number,
	lx: number, ly: number, lz: number,
	dx: number, dy: number, dz: number
): number
	local projx, projy, projz = MathUtils.projectPointOnLine(
		px, py, pz, lx, ly, lz, dx, dy, dz
	)
	local vx, vy, vz = px - projx, py - projy, pz - projz
	return math.sqrt(vx * vx + vy * vy + vz * vz)
end

function MathUtils.solveQuadratic(a: number, b: number, c: number): { number }?
	if math.abs(a) < EPSILON then
		if math.abs(b) < EPSILON then
			return nil
		end
		return { -c / b }
	end

	local discriminant = b * b - 4 * a * c
	if discriminant < -EPSILON then
		return nil
	end
	if discriminant < EPSILON then
		return { -b / (2 * a) }
	end
	local sqrtDisc = math.sqrt(discriminant)
	return {
		(-b + sqrtDisc) / (2 * a),
		(-b - sqrtDisc) / (2 * a)
	}
end

function MathUtils.solveCubic(a: number, b: number, c: number, d: number): { number }?
	if math.abs(a) < EPSILON then
		return MathUtils.solveQuadratic(b, c, d)
	end

	local b1 = b / a
	local c1 = c / a
	local d1 = d / a

	local p = (3 * c1 - b1 * b1) / 3
	local q = (2 * b1 * b1 * b1 - 9 * b1 * c1 + 27 * d1) / 27

	local discriminant = q * q / 4 + p * p * p / 27

	if discriminant > EPSILON then
		local sqrtDisc = math.sqrt(discriminant)
		local u = cubeRoot(-q / 2 + sqrtDisc)
		local v = cubeRoot(-q / 2 - sqrtDisc)
		return { u + v - b1 / 3 }
	elseif discriminant < -EPSILON then
		local r = math.sqrt(-p * p * p / 27)
		local phi = math.acos(math.min(1, math.max(-1, -q / (2 * r))))
		local roots = {}
		for k = 0, 2 do
			roots[k + 1] = 2 * (-p / 3) ^ 0.5 * math.cos((phi + 2 * k * math.pi) / 3) - b1 / 3
		end
		return roots
	else
		local u = cubeRoot(-q / 2)
		local root1 = 2 * u - b1 / 3
		local root2 = -u - b1 / 3
		return { root1, root2 }
	end
end

function MathUtils.gaussian(x: number, mean: number, stdDev: number): number
	local exponent = -0.5 * ((x - mean) / stdDev) ^ 2
	return math.exp(exponent) / (stdDev * math.sqrt(TWO_PI))
end

function MathUtils.sigmoid(x: number, gain: number?, center: number?): number
	gain = gain or 1
	center = center or 0
	return 1 / (1 + math.exp(-gain * (x - center)))
end

function MathUtils.smoothstep(edge0: number, edge1: number, x: number): number
	x = MathUtils.clamp((x - edge0) / (edge1 - edge0), 0, 1)
	return x * x * (3 - 2 * x)
end

function MathUtils.smootherstep(edge0: number, edge1: number, x: number): number
	x = MathUtils.clamp((x - edge0) / (edge1 - edge0), 0, 1)
	return x * x * x * (x * (x * 6 - 15) + 10)
end

function MathUtils.hermite(
	p0: number, v0: number,
	p1: number, v1: number,
	t: number
): number
	local t2 = t * t
	local t3 = t2 * t
	local h00 = 2 * t3 - 3 * t2 + 1
	local h10 = t3 - 2 * t2 + t
	local h01 = -2 * t3 + 3 * t2
	local h11 = t3 - t2
	return h00 * p0 + h10 * v0 + h01 * p1 + h11 * v1
end

function MathUtils.catmullRom(
	p0: number, p1: number, p2: number, p3: number,
	t: number
): number
	local t2 = t * t
	local t3 = t2 * t
	return 0.5 * (
		(-t3 + 2 * t2 - t) * p0 +
			(3 * t3 - 5 * t2 + 2) * p1 +
			(-3 * t3 + 4 * t2 + t) * p2 +
			(t3 - t2) * p3
	)
end

function MathUtils.bezier(
	p0: number, p1: number, p2: number, p3: number,
	t: number
): number
	local mt = 1 - t
	local mt2 = mt * mt
	local t2 = t * t
	return mt2 * mt * p0 + 3 * mt2 * t * p1 + 3 * mt * t2 * p2 + t2 * t * p3
end

function MathUtils.bezierDerivative(
	p0: number, p1: number, p2: number, p3: number,
	t: number
): number
	local mt = 1 - t
	return 3 * (p1 - p0) * mt * mt +
		6 * (p2 - p1) * mt * t +
		3 * (p3 - p2) * t * t
end

function MathUtils.quadraticBezier(
	p0: number, p1: number, p2: number,
	t: number
): number
	local mt = 1 - t
	return mt * mt * p0 + 2 * mt * t * p1 + t * t * p2
end

function MathUtils.fresnelIn(t: number): number
	return 1 - math.cos(t * HALF_PI)
end

function MathUtils.fresnelOut(t: number): number
	return math.sin(t * HALF_PI)
end

function MathUtils.fresnelInOut(t: number): number
	return (1 - math.cos(t * math.pi)) * 0.5
end

function MathUtils.elasticIn(t: number, amplitude: number?, period: number?): number
	if t <= 0 then return 0 end
	if t >= 1 then return 1 end
	amplitude = amplitude or 1
	period = period or 0.3
	local s = period / (TWO_PI) * math.asin(1 / amplitude)
	return -(amplitude * 2 ^ (10 * (t - 1)) * math.sin((t - 1 - s) * TWO_PI / period))
end

function MathUtils.elasticOut(t: number, amplitude: number?, period: number?): number
	if t <= 0 then return 0 end
	if t >= 1 then return 1 end
	amplitude = amplitude or 1
	period = period or 0.3
	local s = period / (TWO_PI) * math.asin(1 / amplitude)
	return amplitude * 2 ^ (-10 * t) * math.sin((t - s) * TWO_PI / period) + 1
end

function MathUtils.bounceOut(t: number): number
	if t < 1 / 2.75 then
		return 7.5625 * t * t
	elseif t < 2 / 2.75 then
		t = t - 1.5 / 2.75
		return 7.5625 * t * t + 0.75
	elseif t < 2.5 / 2.75 then
		t = t - 2.25 / 2.75
		return 7.5625 * t * t + 0.9375
	else
		t = t - 2.625 / 2.75
		return 7.5625 * t * t + 0.984375
	end
end

function MathUtils.bounceIn(t: number): number
	return 1 - MathUtils.bounceOut(1 - t)
end

function MathUtils.backIn(t: number, overshoot: number?): number
	overshoot = overshoot or 1.70158
	return t * t * ((overshoot + 1) * t - overshoot)
end

function MathUtils.backOut(t: number, overshoot: number?): number
	overshoot = overshoot or 1.70158
	t = t - 1
	return t * t * ((overshoot + 1) * t + overshoot) + 1
end

function MathUtils.linearToGamma(value: number): number
	return value <= 0.0031308 and 12.92 * value or 1.055 * value ^ (1 / 2.4) - 0.055
end

function MathUtils.gammaToLinear(value: number): number
	return value <= 0.04045 and value / 12.92 or ((value + 0.055) / 1.055) ^ 2.4
end

function MathUtils.colorLerp(c1: Color3, c2: Color3, t: number): Color3
	return Color3.new(
		MathUtils.lerp(c1.R, c2.R, t),
		MathUtils.lerp(c1.G, c2.G, t),
		MathUtils.lerp(c1.B, c2.B, t)
	)
end

function MathUtils.colorToHSV(color: Color3): (number, number, number)
	local r, g, b = color.R, color.G, color.B
	local max = math.max(r, g, b)
	local min = math.min(r, g, b)
	local delta = max - min

	local h, s, v = 0, 0, max

	if delta > EPSILON then
		s = delta / max
		if max == r then
			h = ((g - b) / delta) % 6
		elseif max == g then
			h = (b - r) / delta + 2
		else
			h = (r - g) / delta + 4
		end
		h = h * 60
	end

	return h, s, v
end

function MathUtils.hsvToColor(h: number, s: number, v: number): Color3
	local c = v * s
	local hp = h / 60
	local x = c * (1 - math.abs(hp % 2 - 1))

	local r = 0
	local g = 0
	local b = 0
	if hp < 1 then
		r, g, b = c, x, 0
	elseif hp < 2 then
		r, g, b = x, c, 0
	elseif hp < 3 then
		r, g, b = 0, c, x
	elseif hp < 4 then
		r, g, b = 0, x, c
	elseif hp < 5 then
		r, g, b = x, 0, c
	else
		r, g, b = c, 0, x
	end

	local m = v - c
	return Color3.new(r + m, g + m, b + m)
end

function MathUtils.closestPointsOnSegments(a1: Vector3, a2: Vector3, b1: Vector3, b2: Vector3): (Vector3, Vector3)
	local d1 = a2 - a1
	local d2 = b2 - b1
	local r = a1 - b1
	local a = d1:Dot(d1)
	local e = d2:Dot(d2)
	local f = d2:Dot(r)
	local s, t = 0, 0
	local c = d1:Dot(r)
	local b = d1:Dot(d2)
	local denom = a * e - b * b
	if denom > 1e-6 then
		s = math.clamp((b * f - c * e) / denom, 0, 1)
		t = math.clamp((a * f - b * c) / denom, 0, 1)
	end
	local p1 = a1 + d1 * s
	local p2 = b1 + d2 * t
	return p1, p2
end

function MathUtils.isFinite(value: number): boolean
	return value == value and value ~= math.huge and value ~= -math.huge
end

function MathUtils.approximately(a: number, b: number, epsilon: number?): boolean
	return math.abs(a - b) <= (epsilon or EPSILON)
end

function MathUtils.safeDivide(numerator: number, denominator: number, fallback: number?): number
	if math.abs(denominator) < EPSILON then
		return fallback or 0
	end
	return numerator / denominator
end

function MathUtils.saturate(value: number): number
	return value < 0 and 0 or value > 1 and 1 or value
end

function MathUtils.snap(value: number, step: number): number
	if math.abs(step) < EPSILON then
		return value
	end
	return math.floor(value / step + 0.5) * step
end

function MathUtils.wrap(value: number, minValue: number, maxValue: number): number
	local range = maxValue - minValue
	if math.abs(range) < EPSILON then
		return minValue
	end
	return ((value - minValue) % range) + minValue
end

function MathUtils.safeUnit(vector: Vector3, fallback: Vector3?): Vector3
	local mag = vector.Magnitude
	if mag < EPSILON then
		return fallback or Vector3.zero
	end
	return vector / mag
end

function MathUtils.clampMagnitude(vector: Vector3, maxMagnitude: number): Vector3
	local magSq = vector:Dot(vector)
	local maxSq = maxMagnitude * maxMagnitude
	if magSq <= maxSq or magSq < EPSILON then
		return vector
	end
	return vector * (maxMagnitude / math.sqrt(magSq))
end

function MathUtils.moveTowardsVector(current: Vector3, target: Vector3, maxDelta: number): Vector3
	local delta = target - current
	local mag = delta.Magnitude
	if mag <= maxDelta or mag < EPSILON then
		return target
	end
	return current + delta / mag * maxDelta
end

function MathUtils.projectVector(vector: Vector3, onto: Vector3): Vector3
	local denom = onto:Dot(onto)
	if denom < EPSILON then
		return Vector3.zero
	end
	return onto * (vector:Dot(onto) / denom)
end

function MathUtils.rejectVector(vector: Vector3, normal: Vector3): Vector3
	return vector - MathUtils.projectVector(vector, normal)
end

function MathUtils.slideVector(vector: Vector3, normal: Vector3): Vector3
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	return vector - n * vector:Dot(n)
end

function MathUtils.angleBetweenVectors(a: Vector3, b: Vector3): number
	local denom = a.Magnitude * b.Magnitude
	if denom < EPSILON then
		return 0
	end
	return math.acos(math.clamp(a:Dot(b) / denom, -1, 1))
end

function MathUtils.signedAngleBetweenVectors(a: Vector3, b: Vector3, axis: Vector3): number
	local angle = MathUtils.angleBetweenVectors(a, b)
	local sign = MathUtils.sign(axis:Dot(a:Cross(b)))
	return angle * sign
end

function MathUtils.closestPointOnSegment(point: Vector3, a: Vector3, b: Vector3): (Vector3, number)
	local ab = b - a
	local denom = ab:Dot(ab)
	if denom < EPSILON then
		return a, 0
	end
	local t = math.clamp((point - a):Dot(ab) / denom, 0, 1)
	return a + ab * t, t
end

function MathUtils.distanceSquaredPointSegment(point: Vector3, a: Vector3, b: Vector3): number
	local closest, _segmentT = MathUtils.closestPointOnSegment(point, a, b)
	local delta = point - closest
	return delta:Dot(delta)
end

function MathUtils.closestPointOnAABB(point: Vector3, minPoint: Vector3, maxPoint: Vector3): Vector3
	return Vector3.new(
		math.clamp(point.X, minPoint.X, maxPoint.X),
		math.clamp(point.Y, minPoint.Y, maxPoint.Y),
		math.clamp(point.Z, minPoint.Z, maxPoint.Z)
	)
end

function MathUtils.pointInAABB(point: Vector3, minPoint: Vector3, maxPoint: Vector3): boolean
	return point.X >= minPoint.X and point.X <= maxPoint.X and
		point.Y >= minPoint.Y and point.Y <= maxPoint.Y and
		point.Z >= minPoint.Z and point.Z <= maxPoint.Z
end

function MathUtils.closestPointOnOBB(point: Vector3, boxCFrame: CFrame, halfExtents: Vector3): Vector3
	local right = boxCFrame.RightVector
	local up = boxCFrame.UpVector
	local look = boxCFrame.LookVector
	local pos = boxCFrame.Position

	local offset = point - pos
	local localPoint = Vector3.new(offset:Dot(right), offset:Dot(up), offset:Dot(look))
	local clamped = Vector3.new(
		math.clamp(localPoint.X, -halfExtents.X, halfExtents.X),
		math.clamp(localPoint.Y, -halfExtents.Y, halfExtents.Y),
		math.clamp(localPoint.Z, -halfExtents.Z, halfExtents.Z)
	)
	return pos + right * clamped.X + up * clamped.Y + look * clamped.Z
end

function MathUtils.pointInOBB(point: Vector3, boxCFrame: CFrame, halfExtents: Vector3): boolean
	local right = boxCFrame.RightVector
	local up = boxCFrame.UpVector
	local look = boxCFrame.LookVector
	local pos = boxCFrame.Position

	local offset = point - pos
	local localPoint = Vector3.new(offset:Dot(right), offset:Dot(up), offset:Dot(look))
	return localPoint.X >= -halfExtents.X and localPoint.X <= halfExtents.X and
		localPoint.Y >= -halfExtents.Y and localPoint.Y <= halfExtents.Y and
		localPoint.Z >= -halfExtents.Z and localPoint.Z <= halfExtents.Z
end

function MathUtils.raySphereIntersection(origin: Vector3, direction: Vector3, center: Vector3, radius: number): (boolean, number?, number?)
	local m = origin - center
	local a = direction:Dot(direction)
	if a <= 0 then
		return false, nil, nil
	end
	local b = 2 * m:Dot(direction)
	local c = m:Dot(m) - radius * radius
	local roots = MathUtils.solveQuadratic(a, b, c)
	if not roots then
		return false, nil, nil
	end
	if #roots == 1 then
		return true, roots[1], roots[1]
	end
	return true, math.min(roots[1], roots[2]), math.max(roots[1], roots[2])
end

function MathUtils.aabbOverlap(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): boolean
	return minA.X <= maxB.X and maxA.X >= minB.X and
		minA.Y <= maxB.Y and maxA.Y >= minB.Y and
		minA.Z <= maxB.Z and maxA.Z >= minB.Z
end

function MathUtils.aabbIntersectionDepth(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): Vector3?
	if not MathUtils.aabbOverlap(minA, maxA, minB, maxB) then
		return nil
	end
	return Vector3.new(
		math.min(maxA.X, maxB.X) - math.max(minA.X, minB.X),
		math.min(maxA.Y, maxB.Y) - math.max(minA.Y, minB.Y),
		math.min(maxA.Z, maxB.Z) - math.max(minA.Z, minB.Z)
	)
end

function MathUtils.expandAABB(minPoint: Vector3, maxPoint: Vector3, amount: number): (Vector3, Vector3)
	local expand = Vector3.new(amount, amount, amount)
	return minPoint - expand, maxPoint + expand
end

function MathUtils.quaternionDot(qx1: number, qy1: number, qz1: number, qw1: number, qx2: number, qy2: number, qz2: number, qw2: number): number
	return qx1 * qx2 + qy1 * qy2 + qz1 * qz2 + qw1 * qw2
end

function MathUtils.quaternionNormalize(qx: number, qy: number, qz: number, qw: number): (number, number, number, number)
	local magSq = qx * qx + qy * qy + qz * qz + qw * qw
	if magSq < EPSILON then
		return 0, 0, 0, 1
	end
	local inv = 1 / math.sqrt(magSq)
	return qx * inv, qy * inv, qz * inv, qw * inv
end

function MathUtils.quaternionConjugate(qx: number, qy: number, qz: number, qw: number): (number, number, number, number)
	return -qx, -qy, -qz, qw
end

function MathUtils.quaternionInverse(qx: number, qy: number, qz: number, qw: number): (number, number, number, number)
	local magSq = qx * qx + qy * qy + qz * qz + qw * qw
	if magSq < EPSILON then
		return 0, 0, 0, 1
	end
	return -qx / magSq, -qy / magSq, -qz / magSq, qw / magSq
end

function MathUtils.quaternionFromTo(from: Vector3, to: Vector3): (number, number, number, number)
	local f = MathUtils.safeUnit(from, Vector3.new(0, 0, -1))
	local t = MathUtils.safeUnit(to, Vector3.new(0, 0, -1))
	local dot = math.clamp(f:Dot(t), -1, 1)
	if dot > 1 - EPSILON then
		return 0, 0, 0, 1
	end
	if dot < -1 + EPSILON then
		local axis = f:Cross(Vector3.new(1, 0, 0))
		if axis.Magnitude < EPSILON then
			axis = f:Cross(Vector3.new(0, 1, 0))
		end
		axis = axis.Unit
		return MathUtils.angleAxisToQuaternion(math.pi, axis.X, axis.Y, axis.Z)
	end
	local axis = f:Cross(t)
	local s = math.sqrt((1 + dot) * 2)
	local invS = 1 / s
	return MathUtils.quaternionNormalize(axis.X * invS, axis.Y * invS, axis.Z * invS, s * 0.5)
end

function MathUtils.quaternionIntegrateAngularVelocity(qx: number, qy: number, qz: number, qw: number, angularVelocity: Vector3, dt: number): (number, number, number, number)
	local ax = angularVelocity.X * dt
	local ay = angularVelocity.Y * dt
	local az = angularVelocity.Z * dt
	local angle = math.sqrt(ax * ax + ay * ay + az * az)
	if angle < EPSILON then
		return MathUtils.quaternionNormalize(qx, qy, qz, qw)
	end
	local invAngle = 1 / angle
	local rx, ry, rz, rw = MathUtils.angleAxisToQuaternion(angle, ax * invAngle, ay * invAngle, az * invAngle)
	local x, y, z, w = MathUtils.quaternionMultiply(qx, qy, qz, qw, rx, ry, rz, rw)
	return MathUtils.quaternionNormalize(x, y, z, w)
end

function MathUtils.orthonormalizeCFrame(cf: CFrame): CFrame
	local position = cf.Position
	local right = MathUtils.safeUnit(cf.RightVector, Vector3.new(1, 0, 0))
	local up = cf.UpVector - right * cf.UpVector:Dot(right)
	up = MathUtils.safeUnit(up, Vector3.new(0, 1, 0))
	local back = right:Cross(up)
	if back.Magnitude < EPSILON then
		back = Vector3.new(0, 0, 1)
	else
		back = back.Unit
	end
	up = back:Cross(right).Unit
	return CFrame.fromMatrix(position, right, up, back)
end

function MathUtils.lookRotation(forward: Vector3, up: Vector3?): CFrame
	local f = MathUtils.safeUnit(forward, Vector3.new(0, 0, -1))
	local u = MathUtils.safeUnit(up or Vector3.new(0, 1, 0), Vector3.new(0, 1, 0))
	local r = u:Cross(f)
	if r.Magnitude < EPSILON then
		r = Vector3.new(1, 0, 0)
	else
		r = r.Unit
	end
	u = f:Cross(r).Unit
	return CFrame.fromMatrix(Vector3.zero, r, u, -f)
end

function MathUtils.pointPlaneDistance(point: Vector3, planeNormal: Vector3, planeD: number): number
	return planeNormal:Dot(point) + planeD
end

function MathUtils.barycentricCoordinates(point: Vector3, a: Vector3, b: Vector3, c: Vector3): (number, number, number)
	local v0 = b - a
	local v1 = c - a
	local v2 = point - a
	local d00 = v0:Dot(v0)
	local d01 = v0:Dot(v1)
	local d11 = v1:Dot(v1)
	local d20 = v2:Dot(v0)
	local d21 = v2:Dot(v1)
	local denom = d00 * d11 - d01 * d01
	if math.abs(denom) < EPSILON then
		return 1, 0, 0
	end
	local v = (d11 * d20 - d01 * d21) / denom
	local w = (d00 * d21 - d01 * d20) / denom
	local u = 1 - v - w
	return u, v, w
end

function MathUtils.pointInTriangle(point: Vector3, a: Vector3, b: Vector3, c: Vector3, epsilon: number?): boolean
	local e = epsilon or EPSILON
	local u, v, w = MathUtils.barycentricCoordinates(point, a, b, c)
	return u >= -e and v >= -e and w >= -e and u <= 1 + e and v <= 1 + e and w <= 1 + e
end

function MathUtils.closestPointOnTriangle(point: Vector3, a: Vector3, b: Vector3, c: Vector3): Vector3
	local ab = b - a
	local ac = c - a
	local ap = point - a
	local d1 = ab:Dot(ap)
	local d2 = ac:Dot(ap)
	if d1 <= 0 and d2 <= 0 then return a end
	local bp = point - b
	local d3 = ab:Dot(bp)
	local d4 = ac:Dot(bp)
	if d3 >= 0 and d4 <= d3 then return b end
	local vc = d1 * d4 - d3 * d2
	if vc <= 0 and d1 >= 0 and d3 <= 0 then
		local v = d1 / (d1 - d3)
		return a + ab * v
	end
	local cp = point - c
	local d5 = ab:Dot(cp)
	local d6 = ac:Dot(cp)
	if d6 >= 0 and d5 <= d6 then return c end
	local vb = d5 * d2 - d1 * d6
	if vb <= 0 and d2 >= 0 and d6 <= 0 then
		local w = d2 / (d2 - d6)
		return a + ac * w
	end
	local va = d3 * d6 - d5 * d4
	if va <= 0 and (d4 - d3) >= 0 and (d5 - d6) >= 0 then
		local w = (d4 - d3) / ((d4 - d3) + (d5 - d6))
		return b + (c - b) * w
	end
	local denom = 1 / (va + vb + vc)
	local v = vb * denom
	local w = vc * denom
	return a + ab * v + ac * w
end

function MathUtils.rayTriangleIntersection(origin: Vector3, direction: Vector3, a: Vector3, b: Vector3, c: Vector3, cullBackface: boolean?): (boolean, number?, number?, number?)
	local edge1 = b - a
	local edge2 = c - a
	local pvec = direction:Cross(edge2)
	local det = edge1:Dot(pvec)
	if cullBackface then
		if det < EPSILON then return false, nil, nil, nil end
	else
		if math.abs(det) < EPSILON then return false, nil, nil, nil end
	end
	local invDet = 1 / det
	local tvec = origin - a
	local u = tvec:Dot(pvec) * invDet
	if u < 0 or u > 1 then return false, nil, nil, nil end
	local qvec = tvec:Cross(edge1)
	local v = direction:Dot(qvec) * invDet
	if v < 0 or u + v > 1 then return false, nil, nil, nil end
	local t = edge2:Dot(qvec) * invDet
	if t < 0 then return false, nil, nil, nil end
	return true, t, u, v
end

function MathUtils.segmentTriangleIntersection(p0: Vector3, p1: Vector3, a: Vector3, b: Vector3, c: Vector3): (boolean, number?, Vector3?)
	local delta = p1 - p0
	local hit, t = MathUtils.rayTriangleIntersection(p0, delta, a, b, c, false)
	if not hit or not t or t < 0 or t > 1 then
		return false, nil, nil
	end
	return true, t, p0 + delta * t
end

function MathUtils.rayAABBIntersection(origin: Vector3, direction: Vector3, minPoint: Vector3, maxPoint: Vector3): (boolean, number?, number?)
	local tMin = -math.huge
	local tMax = math.huge
	local function slab(o: number, d: number, mn: number, mx: number): boolean
		if math.abs(d) < EPSILON then
			return o >= mn and o <= mx
		end
		local invD = 1 / d
		local t1 = (mn - o) * invD
		local t2 = (mx - o) * invD
		if t1 > t2 then t1, t2 = t2, t1 end
		if t1 > tMin then tMin = t1 end
		if t2 < tMax then tMax = t2 end
		return tMin <= tMax
	end
	if not slab(origin.X, direction.X, minPoint.X, maxPoint.X) then return false, nil, nil end
	if not slab(origin.Y, direction.Y, minPoint.Y, maxPoint.Y) then return false, nil, nil end
	if not slab(origin.Z, direction.Z, minPoint.Z, maxPoint.Z) then return false, nil, nil end
	if tMax < 0 then return false, nil, nil end
	return true, tMin, tMax
end

function MathUtils.rayOBBIntersection(origin: Vector3, direction: Vector3, boxCFrame: CFrame, halfExtents: Vector3): (boolean, number?, number?)
	local right = boxCFrame.RightVector
	local up = boxCFrame.UpVector
	local look = boxCFrame.LookVector
	local pos = boxCFrame.Position

	local offset = origin - pos
	local localOrigin = Vector3.new(offset:Dot(right), offset:Dot(up), offset:Dot(look))
	local localDirection = Vector3.new(direction:Dot(right), direction:Dot(up), direction:Dot(look))
	return MathUtils.rayAABBIntersection(localOrigin, localDirection, -halfExtents, halfExtents)
end

function MathUtils.sphereAABBOverlap(center: Vector3, radius: number, minPoint: Vector3, maxPoint: Vector3): (boolean, Vector3, number)
	local closest = MathUtils.closestPointOnAABB(center, minPoint, maxPoint)
	local delta = center - closest
	local distSq = delta:Dot(delta)
	if distSq > radius * radius then
		return false, Vector3.zero, 0
	end
	local dist = math.sqrt(distSq)
	if dist > EPSILON then
		return true, delta / dist, radius - dist
	end
	local boxCenter = (minPoint + maxPoint) * 0.5
	local half = (maxPoint - minPoint) * 0.5
	local localPoint = center - boxCenter
	local dx = half.X - math.abs(localPoint.X)
	local dy = half.Y - math.abs(localPoint.Y)
	local dz = half.Z - math.abs(localPoint.Z)
	if dx <= dy and dx <= dz then
		return true, Vector3.new(MathUtils.sign(localPoint.X), 0, 0), radius + dx
	elseif dy <= dz then
		return true, Vector3.new(0, MathUtils.sign(localPoint.Y), 0), radius + dy
	end
	return true, Vector3.new(0, 0, MathUtils.sign(localPoint.Z)), radius + dz
end

function MathUtils.sphereOBBOverlap(center: Vector3, radius: number, boxCFrame: CFrame, halfExtents: Vector3): (boolean, Vector3, number)
	local right = boxCFrame.RightVector
	local up = boxCFrame.UpVector
	local look = boxCFrame.LookVector
	local pos = boxCFrame.Position

	local offset = center - pos
	local localCenter = Vector3.new(offset:Dot(right), offset:Dot(up), offset:Dot(look))
	local hit, localNormal, depth = MathUtils.sphereAABBOverlap(localCenter, radius, -halfExtents, halfExtents)
	local normal = right * localNormal.X + up * localNormal.Y + look * localNormal.Z
	return hit, normal, depth
end

function MathUtils.capsuleCapsuleDistance(a0: Vector3, a1: Vector3, radiusA: number, b0: Vector3, b1: Vector3, radiusB: number): (number, Vector3, Vector3)
	local pA, pB = MathUtils.closestPointsOnSegments(a0, a1, b0, b1)
	local centerDistance = (pA - pB).Magnitude
	return math.max(0, centerDistance - radiusA - radiusB), pA, pB
end

function MathUtils.sweptSphereSphereTime(originA: Vector3, radiusA: number, velocityA: Vector3, originB: Vector3, radiusB: number, velocityB: Vector3): (boolean, number?)
	local relPos = originA - originB
	local relVel = velocityA - velocityB
	local radius = radiusA + radiusB
	local a = relVel:Dot(relVel)
	local b = 2 * relPos:Dot(relVel)
	local c = relPos:Dot(relPos) - radius * radius
	if c <= 0 then
		return true, 0
	end
	local roots = MathUtils.solveQuadratic(a, b, c)
	if not roots then
		return false, nil
	end
	local best = math.huge
	for _, root in ipairs(roots) do
		if root >= 0 and root < best then
			best = root
		end
	end
	if best == math.huge then
		return false, nil
	end
	return true, best
end

function MathUtils.hermiteVector(p0: Vector3, v0: Vector3, p1: Vector3, v1: Vector3, t: number): Vector3
	return Vector3.new(
		MathUtils.hermite(p0.X, v0.X, p1.X, v1.X, t),
		MathUtils.hermite(p0.Y, v0.Y, p1.Y, v1.Y, t),
		MathUtils.hermite(p0.Z, v0.Z, p1.Z, v1.Z, t)
	)
end

function MathUtils.catmullRomVector(p0: Vector3, p1: Vector3, p2: Vector3, p3: Vector3, t: number): Vector3
	return Vector3.new(
		MathUtils.catmullRom(p0.X, p1.X, p2.X, p3.X, t),
		MathUtils.catmullRom(p0.Y, p1.Y, p2.Y, p3.Y, t),
		MathUtils.catmullRom(p0.Z, p1.Z, p2.Z, p3.Z, t)
	)
end

function MathUtils.bezierVector(p0: Vector3, p1: Vector3, p2: Vector3, p3: Vector3, t: number): Vector3
	return Vector3.new(
		MathUtils.bezier(p0.X, p1.X, p2.X, p3.X, t),
		MathUtils.bezier(p0.Y, p1.Y, p2.Y, p3.Y, t),
		MathUtils.bezier(p0.Z, p1.Z, p2.Z, p3.Z, t)
	)
end

function MathUtils.bezierDerivativeVector(p0: Vector3, p1: Vector3, p2: Vector3, p3: Vector3, t: number): Vector3
	return Vector3.new(
		MathUtils.bezierDerivative(p0.X, p1.X, p2.X, p3.X, t),
		MathUtils.bezierDerivative(p0.Y, p1.Y, p2.Y, p3.Y, t),
		MathUtils.bezierDerivative(p0.Z, p1.Z, p2.Z, p3.Z, t)
	)
end

function MathUtils.estimateBezierLength(p0: Vector3, p1: Vector3, p2: Vector3, p3: Vector3, steps: number?): number
	local count = math.max(1, steps or 16)
	local length = 0
	local prev = p0
	for i = 1, count do
		local t = i / count
		local current = MathUtils.bezierVector(p0, p1, p2, p3, t)
		length += (current - prev).Magnitude
		prev = current
	end
	return length
end

function MathUtils.vectorSmoothDamp(current: Vector3, target: Vector3, velocity: Vector3, smoothTime: number, dt: number, maxSpeed: number?): (Vector3, Vector3)
	local x, vx = MathUtils.smoothDamp(current.X, target.X, velocity.X, smoothTime, dt, maxSpeed)
	local y, vy = MathUtils.smoothDamp(current.Y, target.Y, velocity.Y, smoothTime, dt, maxSpeed)
	local z, vz = MathUtils.smoothDamp(current.Z, target.Z, velocity.Z, smoothTime, dt, maxSpeed)
	return Vector3.new(x, y, z), Vector3.new(vx, vy, vz)
end

function MathUtils.applyLinearDrag(velocity: Vector3, drag: number, dt: number): Vector3
	return velocity * math.exp(-math.max(0, drag) * dt)
end

function MathUtils.applyQuadraticDrag(velocity: Vector3, drag: number, dt: number): Vector3
	local speed = velocity.Magnitude
	if speed < EPSILON then
		return Vector3.zero
	end
	local newSpeed = speed / (1 + math.max(0, drag) * speed * dt)
	return velocity * (newSpeed / speed)
end

function MathUtils.solveBallisticArc(origin: Vector3, target: Vector3, speed: number, gravity: number): (boolean, Vector3?, Vector3?)
	local displacement = target - origin
	local horizontal = Vector3.new(displacement.X, 0, displacement.Z)
	local x = horizontal.Magnitude
	local y = displacement.Y
	local g = math.abs(gravity)
	if speed < EPSILON or g < EPSILON then
		return false, nil, nil
	end
	local speedSq = speed * speed
	local discriminant = speedSq * speedSq - g * (g * x * x + 2 * y * speedSq)
	if discriminant < 0 then
		return false, nil, nil
	end
	local sqrtDisc = math.sqrt(discriminant)
	local lowAngle = math.atan((speedSq - sqrtDisc) / (g * math.max(x, EPSILON)))
	local highAngle = math.atan((speedSq + sqrtDisc) / (g * math.max(x, EPSILON)))
	local dir = if x < EPSILON then Vector3.new(0, 0, -1) else horizontal / x
	local lowVelocity = dir * (math.cos(lowAngle) * speed) + Vector3.yAxis * (math.sin(lowAngle) * speed)
	local highVelocity = dir * (math.cos(highAngle) * speed) + Vector3.yAxis * (math.sin(highAngle) * speed)
	return true, lowVelocity, highVelocity
end

function MathUtils.aabbFromPoints(points: { Vector3 }): (Vector3, Vector3)
	if #points == 0 then
		return Vector3.zero, Vector3.zero
	end
	local minPoint = points[1]
	local maxPoint = points[1]
	for i = 2, #points do
		local p = points[i]
		minPoint = Vector3.new(math.min(minPoint.X, p.X), math.min(minPoint.Y, p.Y), math.min(minPoint.Z, p.Z))
		maxPoint = Vector3.new(math.max(maxPoint.X, p.X), math.max(maxPoint.Y, p.Y), math.max(maxPoint.Z, p.Z))
	end
	return minPoint, maxPoint
end

function MathUtils.mergeAABB(minA: Vector3, maxA: Vector3, minB: Vector3, maxB: Vector3): (Vector3, Vector3)
	return Vector3.new(
		math.min(minA.X, minB.X),
		math.min(minA.Y, minB.Y),
		math.min(minA.Z, minB.Z)
	), Vector3.new(
		math.max(maxA.X, maxB.X),
		math.max(maxA.Y, maxB.Y),
		math.max(maxA.Z, maxB.Z)
	)
end

function MathUtils.transformAABB(minPoint: Vector3, maxPoint: Vector3, transform: CFrame): (Vector3, Vector3)
	local corners = {
		Vector3.new(minPoint.X, minPoint.Y, minPoint.Z),
		Vector3.new(maxPoint.X, minPoint.Y, minPoint.Z),
		Vector3.new(minPoint.X, maxPoint.Y, minPoint.Z),
		Vector3.new(maxPoint.X, maxPoint.Y, minPoint.Z),
		Vector3.new(minPoint.X, minPoint.Y, maxPoint.Z),
		Vector3.new(maxPoint.X, minPoint.Y, maxPoint.Z),
		Vector3.new(minPoint.X, maxPoint.Y, maxPoint.Z),
		Vector3.new(maxPoint.X, maxPoint.Y, maxPoint.Z)
	}
	for i = 1, #corners do
		corners[i] = transform:PointToWorldSpace(corners[i])
	end
	return MathUtils.aabbFromPoints(corners)
end

function MathUtils.boundingSphereFromAABB(minPoint: Vector3, maxPoint: Vector3): (Vector3, number)
	local center = (minPoint + maxPoint) * 0.5
	return center, (maxPoint - center).Magnitude
end

function MathUtils.aabbSurfaceArea(minPoint: Vector3, maxPoint: Vector3): number
	local size = maxPoint - minPoint
	return 2 * (size.X * size.Y + size.Y * size.Z + size.Z * size.X)
end

function MathUtils.aabbVolume(minPoint: Vector3, maxPoint: Vector3): number
	local size = maxPoint - minPoint
	return math.max(0, size.X) * math.max(0, size.Y) * math.max(0, size.Z)
end

function MathUtils.projectPointsOnAxis(points: { Vector3 }, axis: Vector3): (number, number)
	local n = MathUtils.safeUnit(axis, Vector3.xAxis)
	if #points == 0 then
		return 0, 0
	end
	local minValue = points[1]:Dot(n)
	local maxValue = minValue
	for i = 2, #points do
		local v = points[i]:Dot(n)
		if v < minValue then minValue = v end
		if v > maxValue then maxValue = v end
	end
	return minValue, maxValue
end

function MathUtils.intervalsOverlap(minA: number, maxA: number, minB: number, maxB: number): (boolean, number)
	local depth = math.min(maxA, maxB) - math.max(minA, minB)
	return depth >= 0, depth
end

function MathUtils.projectAABBOnAxis(minPoint: Vector3, maxPoint: Vector3, axis: Vector3): (number, number)
	local center = (minPoint + maxPoint) * 0.5
	local extents = (maxPoint - minPoint) * 0.5
	local n = MathUtils.safeUnit(axis, Vector3.xAxis)
	local projectionCenter = center:Dot(n)
	local projectionRadius = math.abs(n.X) * extents.X + math.abs(n.Y) * extents.Y + math.abs(n.Z) * extents.Z
	return projectionCenter - projectionRadius, projectionCenter + projectionRadius
end

function MathUtils.projectOBBOnAxis(boxCFrame: CFrame, halfExtents: Vector3, axis: Vector3): (number, number)
	local n = MathUtils.safeUnit(axis, Vector3.xAxis)
	local center = boxCFrame.Position:Dot(n)
	local radius = math.abs(boxCFrame.RightVector:Dot(n)) * halfExtents.X + math.abs(boxCFrame.UpVector:Dot(n)) * halfExtents.Y + math.abs(boxCFrame.LookVector:Dot(n)) * halfExtents.Z
	return center - radius, center + radius
end

function MathUtils.closestPointsOnSegmentsDetailed(a1: Vector3, a2: Vector3, b1: Vector3, b2: Vector3): (Vector3, Vector3, number, number)
	local d1 = a2 - a1
	local d2 = b2 - b1
	local r = a1 - b1
	local a = d1:Dot(d1)
	local e = d2:Dot(d2)
	local f = d2:Dot(r)
	local s = 0
	local t = 0
	if a <= EPSILON and e <= EPSILON then
		return a1, b1, 0, 0
	end
	if a <= EPSILON then
		t = math.clamp(f / e, 0, 1)
	else
		local c = d1:Dot(r)
		if e <= EPSILON then
			s = math.clamp(-c / a, 0, 1)
		else
			local b = d1:Dot(d2)
			local denom = a * e - b * b
			if denom ~= 0 then
				s = math.clamp((b * f - c * e) / denom, 0, 1)
			else
				s = 0
			end
			t = (b * s + f) / e
			if t < 0 then
				t = 0
				s = math.clamp(-c / a, 0, 1)
			elseif t > 1 then
				t = 1
				s = math.clamp((b - c) / a, 0, 1)
			end
		end
	end
	return a1 + d1 * s, b1 + d2 * t, s, t
end

function MathUtils.distanceSquaredSegments(a1: Vector3, a2: Vector3, b1: Vector3, b2: Vector3): number
	local p1, p2: Vector3 = MathUtils.closestPointsOnSegmentsDetailed(a1, a2, b1, b2)
	local delta = p1 - p2
	return delta:Dot(delta)
end

function MathUtils.triangleArea(a: Vector3, b: Vector3, c: Vector3): number
	return (b - a):Cross(c - a).Magnitude * 0.5
end

function MathUtils.signedTetrahedronVolume(a: Vector3, b: Vector3, c: Vector3, d: Vector3): number
	return (b - a):Dot((c - a):Cross(d - a)) / 6
end

function MathUtils.pointInSphere(point: Vector3, center: Vector3, radius: number): boolean
	local delta = point - center
	return delta:Dot(delta) <= radius * radius
end

function MathUtils.sphereSphereOverlap(centerA: Vector3, radiusA: number, centerB: Vector3, radiusB: number): (boolean, Vector3, number)
	local delta = centerA - centerB
	local distSq = delta:Dot(delta)
	local radius = radiusA + radiusB
	if distSq > radius * radius then
		return false, Vector3.zero, 0
	end
	local dist = math.sqrt(distSq)
	local normal = if dist > EPSILON then delta / dist else Vector3.yAxis
	return true, normal, radius - dist
end

function MathUtils.capsulePointDistance(point: Vector3, a: Vector3, b: Vector3, radius: number): (number, Vector3)
	local closest = MathUtils.closestPointOnSegment(point, a, b)
	return math.max(0, (point - closest).Magnitude - radius), closest
end

function MathUtils.capsuleSphereOverlap(a: Vector3, b: Vector3, capsuleRadius: number, sphereCenter: Vector3, sphereRadius: number): (boolean, Vector3, number, Vector3)
	local closest = MathUtils.closestPointOnSegment(sphereCenter, a, b)
	local delta = sphereCenter - closest
	local distSq = delta:Dot(delta)
	local radius = capsuleRadius + sphereRadius
	if distSq > radius * radius then
		return false, Vector3.zero, 0, closest
	end
	local dist = math.sqrt(distSq)
	local normal = if dist > EPSILON then delta / dist else Vector3.yAxis
	return true, normal, radius - dist, closest
end

function MathUtils.square(x: number): number
	return x * x
end

function MathUtils.cube(x: number): number
	return x * x * x
end

function MathUtils.signNonZero(x: number): number
	return if x < 0 then -1 else 1
end

function MathUtils.min3(a: number, b: number, c: number): number
	return math.min(a, math.min(b, c))
end

function MathUtils.max3(a: number, b: number, c: number): number
	return math.max(a, math.max(b, c))
end

function MathUtils.midpoint(a: number, b: number): number
	return a + (b - a) * 0.5
end

function MathUtils.fract(x: number): number
	return x - math.floor(x)
end

function MathUtils.step(edge: number, x: number): number
	return if x < edge then 0 else 1
end

function MathUtils.safeAcos(x: number): number
	return math.acos(math.clamp(x, -1, 1))
end

function MathUtils.safeAsin(x: number): number
	return math.asin(math.clamp(x, -1, 1))
end

function MathUtils.sinc(x: number): number
	if math.abs(x) < EPSILON then
		local x2 = x * x
		return 1 - x2 / 6 + x2 * x2 / 120
	end
	return math.sin(x) / x
end

function MathUtils.lerpPrecise(a: number, b: number, t: number): number
	return (1 - t) * a + t * b
end

function MathUtils.bilerp(v00: number, v10: number, v01: number, v11: number, tx: number, ty: number): number
	local a = MathUtils.lerp(v00, v10, tx)
	local b = MathUtils.lerp(v01, v11, tx)
	return MathUtils.lerp(a, b, ty)
end

function MathUtils.trilerp(c000: number, c100: number, c010: number, c110: number, c001: number, c101: number, c011: number, c111: number, tx: number, ty: number, tz: number): number
	local x00 = MathUtils.lerp(c000, c100, tx)
	local x10 = MathUtils.lerp(c010, c110, tx)
	local x01 = MathUtils.lerp(c001, c101, tx)
	local x11 = MathUtils.lerp(c011, c111, tx)
	local y0 = MathUtils.lerp(x00, x10, ty)
	local y1 = MathUtils.lerp(x01, x11, ty)
	return MathUtils.lerp(y0, y1, tz)
end

function MathUtils.hashInt32(x: number): number
	x = bit32.bxor(x, bit32.rshift(x, 16))
	x = bit32.band(x * 0x7feb352d, 0xffffffff)
	x = bit32.bxor(x, bit32.rshift(x, 15))
	x = bit32.band(x * 0x846ca68b, 0xffffffff)
	x = bit32.bxor(x, bit32.rshift(x, 16))
	return bit32.band(x, 0xffffffff)
end

function MathUtils.hashCoords2(x: number, y: number): number
	return MathUtils.hashInt32(bit32.bxor(bit32.band(x * 73856093, 0xffffffff), bit32.band(y * 19349663, 0xffffffff)))
end

function MathUtils.hashCoords3(x: number, y: number, z: number): number
	local h = bit32.bxor(bit32.band(x * 73856093, 0xffffffff), bit32.band(y * 19349663, 0xffffffff))
	h = bit32.bxor(h, bit32.band(z * 83492791, 0xffffffff))
	return MathUtils.hashInt32(h)
end

function MathUtils.solveLinear(a: number, b: number): { number }?
	if math.abs(a) < EPSILON then
		return nil
	end
	return { -b / a }
end

function MathUtils.solveQuadraticStable(a: number, b: number, c: number): { number }?
	if math.abs(a) < EPSILON then
		return MathUtils.solveLinear(b, c)
	end
	local discriminant = b * b - 4 * a * c
	if discriminant < -EPSILON then
		return nil
	end
	if math.abs(discriminant) <= EPSILON then
		return { -b / (2 * a) }
	end
	local sqrtDisc = math.sqrt(discriminant)
	local q = -0.5 * (b + MathUtils.signNonZero(b) * sqrtDisc)
	local r0 = q / a
	local r1 = c / q
	if r0 > r1 then
		r0, r1 = r1, r0
	end
	return { r0, r1 }
end

function MathUtils.evaluatePolynomial(coefficients: { number }, x: number): number
	local result = 0
	for i = #coefficients, 1, -1 do
		result = result * x + coefficients[i]
	end
	return result
end

function MathUtils.evaluatePolynomialDerivative(coefficients: { number }, x: number): number
	local result = 0
	for i = #coefficients, 2, -1 do
		result = result * x + (i - 1) * coefficients[i]
	end
	return result
end

function MathUtils.newtonRaphson(initial: number, iterations: number, fn: (number) -> number, dfn: (number) -> number): number
	local x = initial
	for _ = 1, iterations do
		local y = fn(x)
		local dy = dfn(x)
		if math.abs(dy) < EPSILON then
			break
		end
		x -= y / dy
	end
	return x
end

function MathUtils.mat3Identity(): (number, number, number, number, number, number, number, number, number)
	return 1, 0, 0, 0, 1, 0, 0, 0, 1
end

function MathUtils.mat3FromCFrame(cf: CFrame): (number, number, number, number, number, number, number, number, number)
	local right = cf.RightVector
	local up = cf.UpVector
	local back = -cf.LookVector
	return right.X, up.X, back.X, right.Y, up.Y, back.Y, right.Z, up.Z, back.Z
end

function MathUtils.mat3Determinant(m00: number, m01: number, m02: number, m10: number, m11: number, m12: number, m20: number, m21: number, m22: number): number
	return m00 * (m11 * m22 - m12 * m21) - m01 * (m10 * m22 - m12 * m20) + m02 * (m10 * m21 - m11 * m20)
end

function MathUtils.mat3Transpose(m00: number, m01: number, m02: number, m10: number, m11: number, m12: number, m20: number, m21: number, m22: number): (number, number, number, number, number, number, number, number, number)
	return m00, m10, m20, m01, m11, m21, m02, m12, m22
end

function MathUtils.mat3MulVec(m00: number, m01: number, m02: number, m10: number, m11: number, m12: number, m20: number, m21: number, m22: number, v: Vector3): Vector3
	return Vector3.new(
		m00 * v.X + m01 * v.Y + m02 * v.Z,
		m10 * v.X + m11 * v.Y + m12 * v.Z,
		m20 * v.X + m21 * v.Y + m22 * v.Z
	)
end

function MathUtils.mat3Mul(a00: number, a01: number, a02: number, a10: number, a11: number, a12: number, a20: number, a21: number, a22: number, b00: number, b01: number, b02: number, b10: number, b11: number, b12: number, b20: number, b21: number, b22: number): (number, number, number, number, number, number, number, number, number)
	return
		a00 * b00 + a01 * b10 + a02 * b20,
		a00 * b01 + a01 * b11 + a02 * b21,
		a00 * b02 + a01 * b12 + a02 * b22,
		a10 * b00 + a11 * b10 + a12 * b20,
		a10 * b01 + a11 * b11 + a12 * b21,
		a10 * b02 + a11 * b12 + a12 * b22,
		a20 * b00 + a21 * b10 + a22 * b20,
		a20 * b01 + a21 * b11 + a22 * b21,
		a20 * b02 + a21 * b12 + a22 * b22
end

function MathUtils.mat3Inverse(m00: number, m01: number, m02: number, m10: number, m11: number, m12: number, m20: number, m21: number, m22: number): (boolean, number, number, number, number, number, number, number, number, number)
	local c00 = m11 * m22 - m12 * m21
	local c01 = -(m10 * m22 - m12 * m20)
	local c02 = m10 * m21 - m11 * m20
	local c10 = -(m01 * m22 - m02 * m21)
	local c11 = m00 * m22 - m02 * m20
	local c12 = -(m00 * m21 - m01 * m20)
	local c20 = m01 * m12 - m02 * m11
	local c21 = -(m00 * m12 - m02 * m10)
	local c22 = m00 * m11 - m01 * m10
	local det = m00 * c00 + m01 * c01 + m02 * c02
	if math.abs(det) < EPSILON then
		return false, 1, 0, 0, 0, 1, 0, 0, 0, 1
	end
	local invDet = 1 / det
	return true,
		c00 * invDet, c10 * invDet, c20 * invDet,
		c01 * invDet, c11 * invDet, c21 * invDet,
		c02 * invDet, c12 * invDet, c22 * invDet
end

function MathUtils.rayCapsuleIntersection(origin: Vector3, direction: Vector3, a: Vector3, b: Vector3, radius: number): (boolean, number?)
	local ba = b - a
	local oa = origin - a
	local baba = ba:Dot(ba)
	local bard = ba:Dot(direction)
	local baoa = ba:Dot(oa)
	local rdoa = direction:Dot(oa)
	local oaoa = oa:Dot(oa)
	local aCoef = baba - bard * bard
	local bCoef = baba * rdoa - baoa * bard
	local cCoef = baba * oaoa - baoa * baoa - radius * radius * baba
	local best = math.huge
	if math.abs(aCoef) > EPSILON then
		local h = bCoef * bCoef - aCoef * cCoef
		if h >= 0 then
			local t = (-bCoef - math.sqrt(h)) / aCoef
			local y = baoa + t * bard
			if t >= 0 and y > 0 and y < baba then
				best = t
			end
		end
	end
	local hitA, tA0 = MathUtils.raySphereIntersection(origin, direction, a, radius)
	if hitA and tA0 and tA0 >= 0 and tA0 < best then
		best = tA0
	end
	local hitB, tB0 = MathUtils.raySphereIntersection(origin, direction, b, radius)
	if hitB and tB0 and tB0 >= 0 and tB0 < best then
		best = tB0
	end
	if best == math.huge then
		return false, nil
	end
	return true, best
end

function MathUtils.segmentSphereIntersection(p0: Vector3, p1: Vector3, center: Vector3, radius: number): (boolean, number?)
	local delta = p1 - p0
	local hit, t0, t1 = MathUtils.raySphereIntersection(p0, delta, center, radius)
	if not hit then
		return false, nil
	end
	local best: number? = nil
	if t0 and t0 >= 0 and t0 <= 1 then best = t0 end
	if t1 and t1 >= 0 and t1 <= 1 and (not best or t1 < best) then best = t1 end
	return best ~= nil, best
end

function MathUtils.segmentCapsuleIntersection(p0: Vector3, p1: Vector3, a: Vector3, b: Vector3, radius: number): (boolean, number?)
	local delta = p1 - p0
	local hit, t = MathUtils.rayCapsuleIntersection(p0, delta, a, b, radius)
	if hit and t and t >= 0 and t <= 1 then
		return true, t
	end
	return false, nil
end

function MathUtils.closestPointOnRay(point: Vector3, origin: Vector3, direction: Vector3): (Vector3, number)
	local denom = direction:Dot(direction)
	if denom < EPSILON then
		return origin, 0
	end
	local t = math.max(0, (point - origin):Dot(direction) / denom)
	return origin + direction * t, t
end

function MathUtils.closestPointsRaySegment(rayOrigin: Vector3, rayDirection: Vector3, segA: Vector3, segB: Vector3): (Vector3, Vector3, number, number)
	local segDir = segB - segA
	local p1, p2, s, t = MathUtils.closestPointsOnSegmentsDetailed(rayOrigin, rayOrigin + rayDirection, segA, segB)
	if s <= 0 then
		p1 = rayOrigin
		p2 = MathUtils.closestPointOnSegment(rayOrigin, segA, segB)
		s = 0
		t = if segDir:Dot(segDir) < EPSILON then 0 else math.clamp((p2 - segA):Dot(segDir) / segDir:Dot(segDir), 0, 1)
	end
	return p1, p2, s, t
end

function MathUtils.isPowerOfTwo(value: number): boolean
	local n = math.floor(value)
	return n > 0 and bit32.band(n, n - 1) == 0
end

function MathUtils.nextPowerOfTwo(value: number): number
	local n = math.max(1, math.floor(value))
	local p = 1
	while p < n do
		p *= 2
	end
	return p
end

function MathUtils.previousPowerOfTwo(value: number): number
	local n = math.max(1, math.floor(value))
	local p = 1
	while p * 2 <= n do
		p *= 2
	end
	return p
end

function MathUtils.alignUp(value: number, alignment: number): number
	if alignment <= 0 then
		return value
	end
	return math.floor((value + alignment - 1) / alignment) * alignment
end

function MathUtils.alignDown(value: number, alignment: number): number
	if alignment <= 0 then
		return value
	end
	return math.floor(value / alignment) * alignment
end

function MathUtils.quantizeUnorm(value: number, minValue: number, maxValue: number, bits: number): number
	local levels = 2 ^ bits - 1
	local t = MathUtils.saturate(MathUtils.inverseLerp(minValue, maxValue, value))
	return math.floor(t * levels + 0.5)
end

function MathUtils.dequantizeUnorm(value: number, minValue: number, maxValue: number, bits: number): number
	local levels = 2 ^ bits - 1
	return MathUtils.lerp(minValue, maxValue, math.clamp(value, 0, levels) / levels)
end

function MathUtils.quantizeSnorm(value: number, bits: number): number
	local maxValue = 2 ^ (bits - 1) - 1
	return math.floor(math.clamp(value, -1, 1) * maxValue + (if value >= 0 then 0.5 else -0.5))
end

function MathUtils.dequantizeSnorm(value: number, bits: number): number
	local maxValue = 2 ^ (bits - 1) - 1
	return math.clamp(value / maxValue, -1, 1)
end

function MathUtils.hashToUnit01(hash: number): number
	return bit32.band(hash, 0xffffffff) / 0xffffffff
end

function MathUtils.valueNoise1(x: number): number
	local ix = math.floor(x)
	local fx = MathUtils.fract(x)
	local u = fx * fx * (3 - 2 * fx)
	local a = MathUtils.hashToUnit01(MathUtils.hashInt32(ix))
	local b = MathUtils.hashToUnit01(MathUtils.hashInt32(ix + 1))
	return MathUtils.lerp(a, b, u)
end

function MathUtils.valueNoise2(x: number, y: number): number
	local ix = math.floor(x)
	local iy = math.floor(y)
	local fx = MathUtils.fract(x)
	local fy = MathUtils.fract(y)
	local ux = fx * fx * (3 - 2 * fx)
	local uy = fy * fy * (3 - 2 * fy)
	local v00 = MathUtils.hashToUnit01(MathUtils.hashCoords2(ix, iy))
	local v10 = MathUtils.hashToUnit01(MathUtils.hashCoords2(ix + 1, iy))
	local v01 = MathUtils.hashToUnit01(MathUtils.hashCoords2(ix, iy + 1))
	local v11 = MathUtils.hashToUnit01(MathUtils.hashCoords2(ix + 1, iy + 1))
	return MathUtils.bilerp(v00, v10, v01, v11, ux, uy)
end

function MathUtils.valueNoise3(x: number, y: number, z: number): number
	local ix = math.floor(x)
	local iy = math.floor(y)
	local iz = math.floor(z)
	local fx = MathUtils.fract(x)
	local fy = MathUtils.fract(y)
	local fz = MathUtils.fract(z)
	local ux = fx * fx * (3 - 2 * fx)
	local uy = fy * fy * (3 - 2 * fy)
	local uz = fz * fz * (3 - 2 * fz)
	return MathUtils.trilerp(
		MathUtils.hashToUnit01(MathUtils.hashCoords3(ix, iy, iz)),
		MathUtils.hashToUnit01(MathUtils.hashCoords3(ix + 1, iy, iz)),
		MathUtils.hashToUnit01(MathUtils.hashCoords3(ix, iy + 1, iz)),
		MathUtils.hashToUnit01(MathUtils.hashCoords3(ix + 1, iy + 1, iz)),
		MathUtils.hashToUnit01(MathUtils.hashCoords3(ix, iy, iz + 1)),
		MathUtils.hashToUnit01(MathUtils.hashCoords3(ix + 1, iy, iz + 1)),
		MathUtils.hashToUnit01(MathUtils.hashCoords3(ix, iy + 1, iz + 1)),
		MathUtils.hashToUnit01(MathUtils.hashCoords3(ix + 1, iy + 1, iz + 1)),
		ux, uy, uz
	)
end

function MathUtils.fbm2(x: number, y: number, octaves: number, lacunarity: number?, gain: number?): number
	local frequency = 1
	local amplitude = 0.5
	local sum = 0
	local norm = 0
	local lac = lacunarity or 2
	local g = gain or 0.5
	for _ = 1, math.max(1, octaves) do
		sum += MathUtils.valueNoise2(x * frequency, y * frequency) * amplitude
		norm += amplitude
		frequency *= lac
		amplitude *= g
	end
	return if norm > EPSILON then sum / norm else 0
end

function MathUtils.fbm3(x: number, y: number, z: number, octaves: number, lacunarity: number?, gain: number?): number
	local frequency = 1
	local amplitude = 0.5
	local sum = 0
	local norm = 0
	local lac = lacunarity or 2
	local g = gain or 0.5
	for _ = 1, math.max(1, octaves) do
		sum += MathUtils.valueNoise3(x * frequency, y * frequency, z * frequency) * amplitude
		norm += amplitude
		frequency *= lac
		amplitude *= g
	end
	return if norm > EPSILON then sum / norm else 0
end

function MathUtils.orthonormalBasisFromNormal(normal: Vector3): (Vector3, Vector3)
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	local sign = MathUtils.signNonZero(n.Z)
	local a = -1 / (sign + n.Z)
	local b = n.X * n.Y * a
	local tangent = Vector3.new(1 + sign * n.X * n.X * a, sign * b, -sign * n.X)
	local bitangent = Vector3.new(b, sign + n.Y * n.Y * a, -n.Y)
	return MathUtils.safeUnit(tangent, Vector3.xAxis), MathUtils.safeUnit(bitangent, Vector3.zAxis)
end

function MathUtils.tangentFrame(normal: Vector3, tangentHint: Vector3?): (Vector3, Vector3, Vector3)
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	local tangent = tangentHint or Vector3.xAxis
	tangent = tangent - n * tangent:Dot(n)
	if tangent.Magnitude < EPSILON then
		local t, b = MathUtils.orthonormalBasisFromNormal(n)
		return t, b, n
	end
	tangent = tangent.Unit
	local bitangent = n:Cross(tangent).Unit
	return tangent, bitangent, n
end

function MathUtils.signedDistanceSphere(point: Vector3, center: Vector3, radius: number): number
	return (point - center).Magnitude - radius
end

function MathUtils.signedDistancePlane(point: Vector3, planePoint: Vector3, planeNormal: Vector3): number
	local n = MathUtils.safeUnit(planeNormal, Vector3.yAxis)
	return (point - planePoint):Dot(n)
end

function MathUtils.signedDistanceAABB(point: Vector3, minPoint: Vector3, maxPoint: Vector3): number
	local center = (minPoint + maxPoint) * 0.5
	local half = (maxPoint - minPoint) * 0.5
	local q = MathUtils.vector3Abs(point - center) - half
	local outside = Vector3.new(math.max(q.X, 0), math.max(q.Y, 0), math.max(q.Z, 0)).Magnitude
	local inside = math.min(math.max(q.X, math.max(q.Y, q.Z)), 0)
	return outside + inside
end

function MathUtils.signedDistanceOBB(point: Vector3, boxCFrame: CFrame, halfExtents: Vector3): number
	return MathUtils.signedDistanceAABB(boxCFrame:PointToObjectSpace(point), -halfExtents, halfExtents)
end

function MathUtils.signedDistanceCapsule(point: Vector3, a: Vector3, b: Vector3, radius: number): number
	local closest = MathUtils.closestPointOnSegment(point, a, b)
	return (point - closest).Magnitude - radius
end

function MathUtils.signedDistanceCylinder(point: Vector3, a: Vector3, b: Vector3, radius: number): number
	local axis = b - a
	local height = axis.Magnitude
	if height < EPSILON then
		return MathUtils.signedDistanceSphere(point, a, radius)
	end
	local n = axis / height
	local pa = point - a
	local axial = pa:Dot(n)
	local radial = (pa - n * axial).Magnitude - radius
	local capped = math.abs(axial - height * 0.5) - height * 0.5
	local outside = Vector2.new(math.max(radial, 0), math.max(capped, 0)).Magnitude
	local inside = math.min(math.max(radial, capped), 0)
	return outside + inside
end

function MathUtils.pointInCapsule(point: Vector3, a: Vector3, b: Vector3, radius: number): boolean
	return MathUtils.distanceSquaredPointSegment(point, a, b) <= radius * radius
end

function MathUtils.normalFromSDF(point: Vector3, sdf: (Vector3) -> number, epsilon: number?): Vector3
	local e = epsilon or 0.001
	local x = sdf(point + Vector3.new(e, 0, 0)) - sdf(point - Vector3.new(e, 0, 0))
	local y = sdf(point + Vector3.new(0, e, 0)) - sdf(point - Vector3.new(0, e, 0))
	local z = sdf(point + Vector3.new(0, 0, e)) - sdf(point - Vector3.new(0, 0, e))
	return MathUtils.safeUnit(Vector3.new(x, y, z), Vector3.yAxis)
end

function MathUtils.normalizePlane(normal: Vector3, d: number): (Vector3, number)
	local mag = normal.Magnitude
	if mag < EPSILON then
		return Vector3.yAxis, d
	end
	return normal / mag, d / mag
end

function MathUtils.sphereInPlane(center: Vector3, radius: number, planeNormal: Vector3, planeD: number): number
	local dist = planeNormal:Dot(center) + planeD
	if dist > radius then return 1 end
	if dist < -radius then return -1 end
	return 0
end

function MathUtils.pointInFrustum(point: Vector3, planes: { Plane }): boolean
	for _, plane in ipairs(planes) do
		if plane.normal:Dot(point) + plane.d < 0 then
			return false
		end
	end
	return true
end

function MathUtils.sphereInFrustum(center: Vector3, radius: number, planes: { Plane }): boolean
	for _, plane in ipairs(planes) do
		if plane.normal:Dot(center) + plane.d < -radius then
			return false
		end
	end
	return true
end

function MathUtils.inertiaTensorSolidSphere(mass: number, radius: number): Vector3
	local i = 0.4 * mass * radius * radius
	return Vector3.new(i, i, i)
end

function MathUtils.inertiaTensorBox(mass: number, size: Vector3): Vector3
	local x2 = size.X * size.X
	local y2 = size.Y * size.Y
	local z2 = size.Z * size.Z
	return Vector3.new(
		mass * (y2 + z2) / 12,
		mass * (x2 + z2) / 12,
		mass * (x2 + y2) / 12
	)
end

function MathUtils.inertiaTensorSolidCylinder(mass: number, radius: number, height: number): Vector3
	local ixz = mass * (3 * radius * radius + height * height) / 12
	local iy = 0.5 * mass * radius * radius
	return Vector3.new(ixz, iy, ixz)
end

function MathUtils.orientation2D(a: Vector2, b: Vector2, c: Vector2): number
	return (b.X - a.X) * (c.Y - a.Y) - (b.Y - a.Y) * (c.X - a.X)
end

function MathUtils.pointInTriangle2D(point: Vector2, a: Vector2, b: Vector2, c: Vector2): boolean
	local o1 = MathUtils.orientation2D(a, b, point)
	local o2 = MathUtils.orientation2D(b, c, point)
	local o3 = MathUtils.orientation2D(c, a, point)
	local hasNeg = o1 < 0 or o2 < 0 or o3 < 0
	local hasPos = o1 > 0 or o2 > 0 or o3 > 0
	return not (hasNeg and hasPos)
end

function MathUtils.segmentSegmentIntersection2D(a0: Vector2, a1: Vector2, b0: Vector2, b1: Vector2): (boolean, number?, number?, Vector2?)
	local r = a1 - a0
	local s = b1 - b0
	local denom = r.X * s.Y - r.Y * s.X
	if math.abs(denom) < EPSILON then
		return false, nil, nil, nil
	end
	local qmp = b0 - a0
	local t = (qmp.X * s.Y - qmp.Y * s.X) / denom
	local u = (qmp.X * r.Y - qmp.Y * r.X) / denom
	if t < 0 or t > 1 or u < 0 or u > 1 then
		return false, t, u, nil
	end
	return true, t, u, a0 + r * t
end

function MathUtils.planeFromPointNormal(point: Vector3, normal: Vector3): Plane
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	return { normal = n, d = -n:Dot(point) }
end

function MathUtils.planeFromTriangle(a: Vector3, b: Vector3, c: Vector3): Plane
	local n = MathUtils.safeUnit((b - a):Cross(c - a), Vector3.yAxis)
	return { normal = n, d = -n:Dot(a) }
end

function MathUtils.distancePointPlane(point: Vector3, planeNormal: Vector3, planeD: number): number
	return planeNormal:Dot(point) + planeD
end

function MathUtils.projectPointOnPlane(point: Vector3, planeNormal: Vector3, planeD: number): Vector3
	local n = MathUtils.safeUnit(planeNormal, Vector3.yAxis)
	return point - n * (n:Dot(point) + planeD)
end

function MathUtils.rayPlaneIntersection(origin: Vector3, direction: Vector3, planeNormal: Vector3, planeD: number): (boolean, number?, Vector3?)
	local denom = planeNormal:Dot(direction)
	if math.abs(denom) < EPSILON then
		return false, nil, nil
	end
	local t = -(planeNormal:Dot(origin) + planeD) / denom
	if t < 0 then
		return false, t, nil
	end
	return true, t, origin + direction * t
end

function MathUtils.reflectVector(direction: Vector3, normal: Vector3): Vector3
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	return direction - n * (2 * direction:Dot(n))
end

function MathUtils.refractVector(direction: Vector3, normal: Vector3, eta: number): (boolean, Vector3)
	local d = MathUtils.safeUnit(direction, Vector3.zAxis)
	local n = MathUtils.safeUnit(normal, Vector3.yAxis)
	local cosi = math.clamp(-d:Dot(n), -1, 1)
	local sint2 = eta * eta * (1 - cosi * cosi)
	if sint2 > 1 then
		return false, Vector3.zero
	end
	local cost = math.sqrt(1 - sint2)
	return true, d * eta + n * (eta * cosi - cost)
end

function MathUtils.frustumFromCamera(cameraCFrame: CFrame, verticalFovRadians: number, aspect: number, nearDistance: number, farDistance: number): { Plane }
	local position = cameraCFrame.Position
	local right = cameraCFrame.RightVector
	local up = cameraCFrame.UpVector
	local forward = cameraCFrame.LookVector
	local near = math.max(EPSILON, nearDistance)
	local far = math.max(near + EPSILON, farDistance)
	local tanY = math.tan(verticalFovRadians * 0.5)
	local nearHalfHeight = near * tanY
	local nearHalfWidth = nearHalfHeight * aspect
	local nearCenter = position + forward * near
	local ntl = nearCenter + up * nearHalfHeight - right * nearHalfWidth
	local ntr = nearCenter + up * nearHalfHeight + right * nearHalfWidth
	local nbl = nearCenter - up * nearHalfHeight - right * nearHalfWidth
	local nbr = nearCenter - up * nearHalfHeight + right * nearHalfWidth
	return {
		MathUtils.planeFromPointNormal(nearCenter, forward),
		MathUtils.planeFromPointNormal(position + forward * far, -forward),
		MathUtils.planeFromTriangle(position, nbl, ntl),
		MathUtils.planeFromTriangle(position, ntr, nbr),
		MathUtils.planeFromTriangle(position, ntl, ntr),
		MathUtils.planeFromTriangle(position, nbr, nbl),
	}
end

function MathUtils.aabbInFrustum(minPoint: Vector3, maxPoint: Vector3, planes: { Plane }): boolean
	for _, plane in ipairs(planes) do
		local n = plane.normal
		local p = Vector3.new(if n.X >= 0 then maxPoint.X else minPoint.X, if n.Y >= 0 then maxPoint.Y else minPoint.Y, if n.Z >= 0 then maxPoint.Z else minPoint.Z)
		if n:Dot(p) + plane.d < 0 then
			return false
		end
	end
	return true
end

function MathUtils.obbInFrustum(boxCFrame: CFrame, halfExtents: Vector3, planes: { Plane }): boolean
	local center = boxCFrame.Position
	local right = boxCFrame.RightVector
	local up = boxCFrame.UpVector
	local look = boxCFrame.LookVector
	for _, plane in ipairs(planes) do
		local n = plane.normal
		local radius = math.abs(n:Dot(right)) * halfExtents.X + math.abs(n:Dot(up)) * halfExtents.Y + math.abs(n:Dot(look)) * halfExtents.Z
		if n:Dot(center) + plane.d + radius < 0 then
			return false
		end
	end
	return true
end

function MathUtils.supportSphere(center: Vector3, radius: number, direction: Vector3): Vector3
	return center + MathUtils.safeUnit(direction, Vector3.xAxis) * radius
end

function MathUtils.supportAABB(minPoint: Vector3, maxPoint: Vector3, direction: Vector3): Vector3
	return Vector3.new(if direction.X >= 0 then maxPoint.X else minPoint.X, if direction.Y >= 0 then maxPoint.Y else minPoint.Y, if direction.Z >= 0 then maxPoint.Z else minPoint.Z)
end

function MathUtils.supportOBB(boxCFrame: CFrame, halfExtents: Vector3, direction: Vector3): Vector3
	local right = boxCFrame.RightVector
	local up = boxCFrame.UpVector
	local look = boxCFrame.LookVector
	local pos = boxCFrame.Position

	local localDirection = Vector3.new(direction:Dot(right), direction:Dot(up), direction:Dot(look))
	local localPoint = Vector3.new(if localDirection.X >= 0 then halfExtents.X else -halfExtents.X, if localDirection.Y >= 0 then halfExtents.Y else -halfExtents.Y, if localDirection.Z >= 0 then halfExtents.Z else -halfExtents.Z)
	return pos + right * localPoint.X + up * localPoint.Y + look * localPoint.Z
end

function MathUtils.supportCapsule(a: Vector3, b: Vector3, radius: number, direction: Vector3): Vector3
	local n = MathUtils.safeUnit(direction, Vector3.xAxis)
	local endpoint = if a:Dot(n) > b:Dot(n) then a else b
	return endpoint + n * radius
end

function MathUtils.obbOBBOverlap(cfA: CFrame, halfA: Vector3, cfB: CFrame, halfB: Vector3): boolean
	local axesA = { cfA.RightVector, cfA.UpVector, cfA.LookVector }
	local axesB = { cfB.RightVector, cfB.UpVector, cfB.LookVector }
	local a = { halfA.X, halfA.Y, halfA.Z }
	local b = { halfB.X, halfB.Y, halfB.Z }
	local r = {}
	local ar = {}
	for i = 1, 3 do
		r[i] = {}
		ar[i] = {}
		for j = 1, 3 do
			r[i][j] = axesA[i]:Dot(axesB[j])
			ar[i][j] = math.abs(r[i][j]) + EPSILON
		end
	end
	local centerDelta = cfB.Position - cfA.Position
	local t = { centerDelta:Dot(axesA[1]), centerDelta:Dot(axesA[2]), centerDelta:Dot(axesA[3]) }
	for i = 1, 3 do
		local rb = b[1] * ar[i][1] + b[2] * ar[i][2] + b[3] * ar[i][3]
		if math.abs(t[i]) > a[i] + rb then
			return false
		end
	end
	for j = 1, 3 do
		local ra = a[1] * ar[1][j] + a[2] * ar[2][j] + a[3] * ar[3][j]
		local tb = math.abs(centerDelta:Dot(axesB[j]))
		if tb > ra + b[j] then
			return false
		end
	end
	for i = 1, 3 do
		local i1 = i % 3 + 1
		local i2 = i1 % 3 + 1
		for j = 1, 3 do
			local j1 = j % 3 + 1
			local j2 = j1 % 3 + 1
			local ra = a[i1] * ar[i2][j] + a[i2] * ar[i1][j]
			local rb = b[j1] * ar[i][j2] + b[j2] * ar[i][j1]
			local dist = math.abs(t[i2] * r[i1][j] - t[i1] * r[i2][j])
			if dist > ra + rb then
				return false
			end
		end
	end
	return true
end

function MathUtils.sdfUnion(a: number, b: number): number
	return math.min(a, b)
end

function MathUtils.sdfIntersection(a: number, b: number): number
	return math.max(a, b)
end

function MathUtils.sdfSubtraction(a: number, b: number): number
	return math.max(a, -b)
end

function MathUtils.sdfSmoothUnion(a: number, b: number, k: number): number
	local h = MathUtils.saturate(0.5 + 0.5 * (b - a) / math.max(k, EPSILON))
	return MathUtils.lerp(b, a, h) - k * h * (1 - h)
end

function MathUtils.sdfSmoothIntersection(a: number, b: number, k: number): number
	return -MathUtils.sdfSmoothUnion(-a, -b, k)
end

function MathUtils.sdfSmoothSubtraction(a: number, b: number, k: number): number
	return MathUtils.sdfSmoothIntersection(a, -b, k)
end

function MathUtils.sphereTrace(origin: Vector3, direction: Vector3, maxDistance: number, maxSteps: number, hitEpsilon: number, sdf: (Vector3) -> number): (boolean, number, Vector3, number)
	local dir = MathUtils.safeUnit(direction, Vector3.zAxis)
	local distance = 0
	local steps = math.max(1, maxSteps)
	for i = 1, steps do
		local point = origin + dir * distance
		local d = sdf(point)
		if math.abs(d) <= hitEpsilon then
			return true, distance, point, i
		end
		distance += math.max(d, hitEpsilon)
		if distance > maxDistance then
			return false, distance, origin + dir * distance, i
		end
	end
	return false, distance, origin + dir * distance, steps
end

function MathUtils.triangleNormal(a: Vector3, b: Vector3, c: Vector3): Vector3
	return MathUtils.safeUnit((b - a):Cross(c - a), Vector3.yAxis)
end

function MathUtils.triangleTangentBasis(p0: Vector3, p1: Vector3, p2: Vector3, uv0: Vector2, uv1: Vector2, uv2: Vector2): (Vector3, Vector3, Vector3)
	local e1 = p1 - p0
	local e2 = p2 - p0
	local duv1 = uv1 - uv0
	local duv2 = uv2 - uv0
	local denom = duv1.X * duv2.Y - duv2.X * duv1.Y
	local normal = MathUtils.triangleNormal(p0, p1, p2)
	if math.abs(denom) < EPSILON then
		local tangent, bitangent = MathUtils.orthonormalBasisFromNormal(normal)
		return tangent, bitangent, normal
	end
	local f = 1 / denom
	local tangent = MathUtils.safeUnit((e1 * duv2.Y - e2 * duv1.Y) * f, Vector3.xAxis)
	local bitangent = MathUtils.safeUnit((e2 * duv1.X - e1 * duv2.X) * f, Vector3.zAxis)
	return tangent, bitangent, normal
end

function MathUtils.polygonArea2D(points: { Vector2 }): number
	local count = #points
	if count < 3 then
		return 0
	end
	local area = 0
	for i = 1, count do
		local a0 = points[i]
		local b0 = points[i % count + 1]
		area += a0.X * b0.Y - b0.X * a0.Y
	end
	return area * 0.5
end

function MathUtils.pointInPolygon2D(point: Vector2, points: { Vector2 }): boolean
	local inside = false
	local count = #points
	local j = count
	for i = 1, count do
		local a0 = points[i]
		local b0 = points[j]
		local denom = b0.Y - a0.Y
		if ((a0.Y > point.Y) ~= (b0.Y > point.Y)) and math.abs(denom) > EPSILON and point.X < (b0.X - a0.X) * (point.Y - a0.Y) / denom + a0.X then
			inside = not inside
		end
		j = i
	end
	return inside
end

local function part1By2(n: number): number
	n = bit32.band(n, 0x000003ff)
	n = bit32.band(bit32.bor(n, bit32.lshift(n, 16)), 0x030000ff)
	n = bit32.band(bit32.bor(n, bit32.lshift(n, 8)), 0x0300f00f)
	n = bit32.band(bit32.bor(n, bit32.lshift(n, 4)), 0x030c30c3)
	n = bit32.band(bit32.bor(n, bit32.lshift(n, 2)), 0x09249249)
	return n
end

function MathUtils.morton3D(x: number, y: number, z: number): number
	return bit32.bor(part1By2(x), bit32.lshift(part1By2(y), 1), bit32.lshift(part1By2(z), 2))
end

function MathUtils.runSelfTests(): boolean
	local function approx(a: number, b: number, tolerance: number?): boolean
		return math.abs(a - b) <= (tolerance or 1e-6)
	end
	local function approxVector3(a: Vector3, b: Vector3, tolerance: number?): boolean
		local t = tolerance or 1e-6
		return approx(a.X, b.X, t) and approx(a.Y, b.Y, t) and approx(a.Z, b.Z, t)
	end

	local rayHit, rayT0, rayT1 = MathUtils.collisionRayAABBInterval(Vector3.new(-2, 0.5, 0.5), Vector3.xAxis, Vector3.zero, Vector3.one)
	assert(rayHit == true, "collisionRayAABBInterval should hit unit AABB")
	assert(approx(rayT0, 2) and approx(rayT1, 3), "collisionRayAABBInterval hit interval mismatch")
	local rayMiss, missT0, missT1 = MathUtils.collisionRayAABBInterval(Vector3.new(-2, 2, 0.5), Vector3.xAxis, Vector3.zero, Vector3.one)
	assert(rayMiss == false and missT0 == 0 and missT1 == 0, "collisionRayAABBInterval miss should return false, 0, 0")

	local closest, segmentT = MathUtils.closestPointOnSegment(Vector3.new(2, 3, 0), Vector3.zero, Vector3.new(10, 0, 0))
	assert(approxVector3(closest, Vector3.new(2, 0, 0)) and approx(segmentT, 0.2), "closestPointOnSegment mismatch")
	assert(approx(MathUtils.distanceSquaredPointSegment(Vector3.new(2, 3, 0), Vector3.zero, Vector3.new(10, 0, 0)), 9), "distanceSquaredPointSegment mismatch")

	local springPosition, springVelocity = MathUtils.springDamp(0, 10, 0, 25, 10, 1)
	local springExp = math.exp(-5)
	assert(approx(springPosition, 10 - 60 * springExp, 1e-5), "springDamp critical position mismatch")
	assert(approx(springVelocity, 250 * springExp, 1e-5), "springDamp critical velocity mismatch")
	local underPosition, underVelocity = MathUtils.springDamp(0, 10, 0, 25, 2, 0.25)
	assert(underPosition == underPosition and underVelocity == underVelocity, "springDamp underdamped should not return NaN")
	local overPosition, overVelocity = MathUtils.springDamp(0, 10, 0, 25, 20, 0.5)
	assert(approx(overPosition, 4.486474591628, 1e-6), "springDamp overdamped position mismatch")
	assert(approx(overVelocity, 7.385534901491, 1e-6), "springDamp overdamped velocity mismatch")

	local sx, sy, sz, sw = MathUtils.quaternionSlerp(0, 0, 0, 1, 0, 1, 0, 0, 0.5)
	local sqrtHalf = math.sqrt(0.5)
	assert(approx(sx, 0) and approx(sy, sqrtHalf) and approx(sz, 0) and approx(sw, sqrtHalf), "quaternionSlerp midpoint mismatch")
	local mx, my, mz, mw = MathUtils.matrixToQuaternion(CFrame.Angles(0, math.pi / 2, 0))
	assert(approx(mx, 0) and approx(my, sqrtHalf, 1e-6) and approx(mz, 0) and approx(mw, sqrtHalf, 1e-6), "matrixToQuaternion Y rotation mismatch")
	local cubicRoots = MathUtils.solveCubic(1, -6, 11, -6)
	assert(cubicRoots ~= nil and #cubicRoots == 3, "solveCubic root count mismatch")
	table.sort(cubicRoots :: { number })
	assert(approx((cubicRoots :: { number })[1], 1) and approx((cubicRoots :: { number })[2], 2) and approx((cubicRoots :: { number })[3], 3), "solveCubic roots mismatch")
	local sphereObbHit, sphereObbNormal, sphereObbDepth, sphereObbPoint = MathUtils.collisionSphereOBB(Vector3.new(1.5, 0, 0), 1, CFrame.new(), Vector3.one)
	assert(sphereObbHit == true and approxVector3(sphereObbNormal, Vector3.xAxis) and approx(sphereObbDepth, 0.5) and approxVector3(sphereObbPoint, Vector3.new(1, 0, 0)), "collisionSphereOBB hit mismatch")
	local sphereObbMiss = MathUtils.collisionSphereOBB(Vector3.new(3, 0, 0), 0.5, CFrame.new(), Vector3.one)
	assert(sphereObbMiss == false, "collisionSphereOBB miss mismatch")

	assert(MathUtils.vector3Abs(Vector3.new(-1, 2, -3)) == Vector3.new(1, 2, 3), "vector3Abs mismatch")
	assert(MathUtils.vector3Min(Vector3.new(1, 5, -2), Vector3.new(3, 4, -5)) == Vector3.new(1, 4, -5), "vector3Min mismatch")
	assert(MathUtils.vector3Max(Vector3.new(1, 5, -2), Vector3.new(3, 4, -5)) == Vector3.new(3, 5, -2), "vector3Max mismatch")
	assert(MathUtils.vector3Hadamard(Vector3.new(2, 3, 4), Vector3.new(5, 6, 7)) == Vector3.new(10, 18, 28), "vector3Hadamard mismatch")
	assert(MathUtils.vector3Reciprocal(Vector3.new(2, 0, -4), 99) == Vector3.new(0.5, 99, -0.25), "vector3Reciprocal mismatch")
	assert(MathUtils.vector3Clamp(Vector3.new(-2, 0.5, 4), Vector3.zero, Vector3.one) == Vector3.new(0, 0.5, 1), "vector3Clamp mismatch")

	local plane = MathUtils.planeFromPointNormal(Vector3.zero, Vector3.yAxis)
	assert(plane.normal == Vector3.yAxis and plane.d == 0, "planeFromPointNormal mismatch")
	assert(MathUtils.pointInFrustum(Vector3.new(0, 1, 0), { plane }) == true, "pointInFrustum should accept point above plane")
	assert(MathUtils.pointInFrustum(Vector3.new(0, -1, 0), { plane }) == false, "pointInFrustum should reject point below plane")
	assert(MathUtils.sphereInFrustum(Vector3.new(0, -0.5, 0), 0.6, { plane }) == true, "sphereInFrustum radius mismatch")

	local contacts: { Contact } = { { depth = 0.1 }, { depth = 0.5 }, {}, { depth = 0.25 } }
	MathUtils.collisionSortContactsByDepth(contacts)
	assert(contacts[1].depth == 0.5 and contacts[2].depth == 0.25 and contacts[4].depth == nil, "collisionSortContactsByDepth mismatch")
	return true
end

function MathUtils.runBenchmarks(): { [string]: number }
	local iterations = 100000
	local results: { [string]: number } = {}

	local function benchmark(name: string, fn: () -> ())
		local startTime = os.clock()
		for _ = 1, iterations do
			fn()
		end
		results[name] = os.clock() - startTime
	end

	benchmark("collisionSphereAABB", function()
		MathUtils.collisionSphereAABB(Vector3.new(0, 0, 0), 1, Vector3.new(-1, -1, -1), Vector3.new(1, 1, 1))
	end)

	benchmark("collisionAABBOverlapDetailed", function()
		MathUtils.collisionAABBOverlapDetailed(Vector3.new(-1, -1, -1), Vector3.new(1, 1, 1), Vector3.new(0, 0, 0), Vector3.new(2, 2, 2))
	end)

	benchmark("quaternionSlerp", function()
		MathUtils.quaternionSlerp(0, 0, 0, 1, 0, 1, 0, 0, 0.5)
	end)

	benchmark("closestPointOnSegment", function()
		MathUtils.closestPointOnSegment(Vector3.new(2, 3, 0), Vector3.zero, Vector3.new(10, 0, 0))
	end)

	benchmark("springDamp", function()
		MathUtils.springDamp(0, 10, 0, 25, 10, 1)
	end)

	benchmark("collisionSphereOBB", function()
		MathUtils.collisionSphereOBB(Vector3.new(1.5, 0, 0), 1, CFrame.new(), Vector3.one)
	end)

	return results
end

type Matrix = { [number]: number }
type VectorN = { [number]: number }

function MathUtils.solveLinearSystemLU(A: Matrix, b: VectorN): VectorN?
	local n = #b
	if #A ~= n * n then
		return nil
	end

	local L: Matrix = table.create(n * n, 0)
	local U: Matrix = table.create(n * n, 0)
	local P: { number } = table.create(n, 0)

	for i = 1, n do
		P[i] = i
	end

	for k = 1, n do
		local maxRow = k
		local maxVal = math.abs(A[(k - 1) * n + k])
		for i = k + 1, n do
			local val = math.abs(A[(i - 1) * n + k])
			if val > maxVal then
				maxRow = i
				maxVal = val
			end
		end

		if maxVal < EPSILON then
			return nil
		end

		P[k], P[maxRow] = P[maxRow], P[k]

		for i = 1, n do
			A[(k - 1) * n + i], A[(maxRow - 1) * n + i] = A[(maxRow - 1) * n + i], A[(k - 1) * n + i]
		end

		U[(k - 1) * n + k] = A[(k - 1) * n + k]
		L[(k - 1) * n + k] = 1

		for i = k + 1, n do
			L[(i - 1) * n + k] = A[(i - 1) * n + k] / U[(k - 1) * n + k]
			U[(k - 1) * n + i] = A[(k - 1) * n + i]
		end

		for j = k + 1, n do
			for i = k + 1, n do
				A[(i - 1) * n + j] = A[(i - 1) * n + j] - L[(i - 1) * n + k] * U[(k - 1) * n + j]
			end
		end
	end

	local Pb: VectorN = table.create(n, 0)
	for i = 1, n do
		Pb[i] = b[P[i]]
	end

	local y: VectorN = table.create(n, 0)
	for i = 1, n do
		local sum = Pb[i]
		for j = 1, i - 1 do
			sum = sum - L[(i - 1) * n + j] * y[j]
		end
		y[i] = sum
	end

	local x: VectorN = table.create(n, 0)
	for i = n, 1, -1 do
		local sum = y[i]
		for j = i + 1, n do
			sum = sum - U[(i - 1) * n + j] * x[j]
		end
		x[i] = sum / U[(i - 1) * n + i]
	end

	return x
end

function MathUtils.conjugateGradient(A: (VectorN) -> VectorN, b: VectorN, maxIter: number, tolerance: number): VectorN
	local n = #b
	local x: VectorN = table.create(n, 0)
	local r: VectorN = table.create(n, 0)
	for i = 1, n do
		r[i] = b[i]
	end
	local p: VectorN = table.create(n, 0)
	for i = 1, n do
		p[i] = r[i]
	end

	local rsold = 0
	for i = 1, n do
		rsold = rsold + r[i] * r[i]
	end

	for iter = 1, maxIter do
		local Ap = A(p)
		local pAp = 0
		for i = 1, n do
			pAp = pAp + p[i] * Ap[i]
		end

		if math.abs(pAp) < EPSILON then
			break
		end

		local alpha = rsold / pAp
		for i = 1, n do
			x[i] = x[i] + alpha * p[i]
			r[i] = r[i] - alpha * Ap[i]
		end

		local rsnew = 0
		for i = 1, n do
			rsnew = rsnew + r[i] * r[i]
		end

		if math.sqrt(rsnew) < tolerance then
			break
		end

		local beta = rsnew / rsold
		for i = 1, n do
			p[i] = r[i] + beta * p[i]
		end

		rsold = rsnew
	end

	return x
end

function MathUtils.monotonicCubicSpline(x: { number }, y: { number }): (number) -> number
	local n = #x
	if n < 2 then
		return function(t: number): number
			return y[1] or 0
		end
	end

	local delta: { number } = table.create(n - 1, 0)
	for i = 1, n - 1 do
		delta[i] = (y[i + 1] - y[i]) / (x[i + 1] - x[i])
	end

	local m: { number } = table.create(n, 0)
	for i = 2, n - 1 do
		if delta[i - 1] * delta[i] <= 0 then
			m[i] = 0
		else
			m[i] = 2 / (1 / delta[i - 1] + 1 / delta[i])
		end
	end
	m[1] = delta[1]
	m[n] = delta[n - 1]

	return function(t: number): number
		if t <= x[1] then
			return y[1]
		end
		if t >= x[n] then
			return y[n]
		end

		local idx = 1
		while idx < n and x[idx + 1] < t do
			idx = idx + 1
		end

		local h = x[idx + 1] - x[idx]
		local t0 = (t - x[idx]) / h
		local t1 = t0 - 1

		local h00 = (1 + 2 * t0) * t1 * t1
		local h10 = t0 * t1 * t1
		local h01 = t0 * t0 * (3 - 2 * t0)
		local h11 = t0 * t0 * t1

		return h00 * y[idx] + h10 * h * m[idx] + h01 * y[idx + 1] + h11 * h * m[idx + 1]
	end
end

function MathUtils.bspline(k: number, degree: number, i: number, t: number, knots: { number }): number
	if degree == 0 then
		if (knots[i] <= t and t < knots[i + 1]) or (i == #knots - degree - 1 and t == knots[i + 1]) then
			return 1
		else
			return 0
		end
	end

	local denom1 = knots[i + degree] - knots[i]
	local term1 = 0
	if math.abs(denom1) > EPSILON then
		term1 = ((t - knots[i]) / denom1) * MathUtils.bspline(k, degree - 1, i, t, knots)
	end

	local denom2 = knots[i + degree + 1] - knots[i + 1]
	local term2 = 0
	if math.abs(denom2) > EPSILON then
		term2 = ((knots[i + degree + 1] - t) / denom2) * MathUtils.bspline(k, degree - 1, i + 1, t, knots)
	end

	return term1 + term2
end

function MathUtils.evaluateBSpline(knots: { number }, controlPoints: { number }, degree: number, t: number): number
	local n = #controlPoints
	local result = 0
	for i = 1, n do
		result = result + controlPoints[i] * MathUtils.bspline(n, degree, i, t, knots)
	end
	return result
end

function MathUtils.qrDecompositionHouseholder(A: Matrix, m: number, n: number): (Matrix, Matrix)
	local Q: Matrix = table.create(m * m, 0)
	local R: Matrix = table.create(m * n, 0)

	for i = 1, m do
		Q[(i - 1) * m + i] = 1
	end

	for i = 1, n do
		for j = 1, n do
			R[(i - 1) * n + j] = A[(i - 1) * n + j]
		end
	end

	for k = 1, n do
		local x: VectorN = table.create(m - k + 1, 0)
		for i = k, m do
			x[i - k + 1] = R[(i - 1) * n + k]
		end

		local normX = 0
		for i = 1, #x do
			normX = normX + x[i] * x[i]
		end
		normX = math.sqrt(normX)

		if normX < EPSILON then
			break
		end

		local alpha = -x[1] / math.abs(x[1]) * normX
		local v: VectorN = table.create(#x, 0)
		for i = 1, #x do
			v[i] = x[i]
		end
		v[1] = v[1] - alpha

		local normV = 0
		for i = 1, #v do
			normV = normV + v[i] * v[i]
		end

		if normV > EPSILON then
			local beta = 2 / normV

			for j = k, n do
				local dot = 0
				for i = k, m do
					dot = dot + R[(i - 1) * n + j] * v[i - k + 1]
				end
				for i = k, m do
					R[(i - 1) * n + j] = R[(i - 1) * n + j] - beta * v[i - k + 1] * dot
				end
			end

			for j = 1, m do
				local dot = 0
				for i = k, m do
					dot = dot + Q[(j - 1) * m + i] * v[i - k + 1]
				end
				for i = k, m do
					Q[(j - 1) * m + i] = Q[(j - 1) * m + i] - beta * v[i - k + 1] * dot
				end
			end
		end
	end

	return Q, R
end

function MathUtils.linearLeastSquares(A: Matrix, b: VectorN, m: number, n: number): VectorN
	local Q, R = MathUtils.qrDecompositionHouseholder(A, m, n)

	local Qtb: VectorN = table.create(n, 0)
	for i = 1, n do
		local sum = 0
		for j = 1, m do
			sum = sum + Q[(i - 1) * m + j] * b[j]
		end
		Qtb[i] = sum
	end

	local x: VectorN = table.create(n, 0)
	for i = n, 1, -1 do
		local sum = Qtb[i]
		for j = i + 1, n do
			sum = sum - R[(i - 1) * n + j] * x[j]
		end
		if math.abs(R[(i - 1) * n + i]) > EPSILON then
			x[i] = sum / R[(i - 1) * n + i]
		else
			x[i] = 0
		end
	end

	return x
end

type Simplex = { [number]: Vector3 }
type SupportFunction = (Vector3) -> Vector3

function MathUtils.gjkSupport(shapeA: SupportFunction, shapeB: SupportFunction, direction: Vector3): Vector3
	return shapeA(direction) - shapeB(-direction)
end

function MathUtils.gjkDoSimplex(simplex: Simplex, direction: Vector3): (boolean, Vector3, Simplex)
	local a = (simplex[#simplex] :: Vector3)
	local b = (simplex[#simplex - 1] :: Vector3)
	local c = (simplex[#simplex - 2] :: Vector3)

	local ao = -a
	local ab = b - a
	local ac = c - a

	if #simplex == 3 then
		local abPerp = ac:Cross(ab):Cross(ab)
		local acPerp = ab:Cross(ac):Cross(ac)

		if abPerp.Magnitude >= EPSILON or acPerp.Magnitude >= EPSILON then
			if abPerp:Dot(ao) > 0 then
				table.remove(simplex, (#simplex))
				return false, abPerp.Unit, simplex
			else
				if acPerp:Dot(ao) > 0 then
					table.remove(simplex, (#simplex - 1))
					return false, acPerp.Unit, simplex
				else
					return true, Vector3.zero, simplex
				end
			end
		end

		table.remove(simplex, 1)
		a = (simplex[#simplex] :: Vector3)
		b = (simplex[#simplex - 1] :: Vector3)
		ao = -a
		ab = b - a
	end

	local abPerp = ab:Cross(ao):Cross(ab)
	if abPerp.Magnitude < EPSILON then
		return false, ao.Unit, simplex
	end
	return false, abPerp.Unit, simplex
end

function MathUtils.gjkCollision(shapeA: SupportFunction, shapeB: SupportFunction): (boolean, Simplex)
	local direction = Vector3.new(1, 0, 0)
	local simplex: Simplex = {}

	table.insert(simplex, MathUtils.gjkSupport(shapeA, shapeB, direction))
	direction = -(simplex[1] :: Vector3)

	for _ = 1, 64 do
		local newPoint = MathUtils.gjkSupport(shapeA, shapeB, direction)

		if newPoint:Dot(newPoint) < EPSILON then
			return true, simplex
		end

		local isDuplicate = false
		for i = 1, #simplex do
			local existing = simplex[i] :: Vector3
			if (existing - newPoint):Dot(existing - newPoint) < EPSILON then
				isDuplicate = true
				break
			end
		end
		if isDuplicate then
			return false, simplex
		end

		table.insert(simplex, newPoint)

		if (simplex[#simplex] :: Vector3):Dot(direction) < 0 then
			return false, simplex
		end

		local contains, newDirection, newSimplex = MathUtils.gjkDoSimplex(simplex, direction)

		if contains then
			return true, newSimplex
		end

		direction = newDirection
		simplex = newSimplex
	end

	return false, simplex
end

type Face = { normal: Vector3, edge: Vector3, distance: number }

function MathUtils.epaPenetration(shapeA: SupportFunction, shapeB: SupportFunction, simplex: Simplex): (number, Vector3)
	local faces: { Face } = {}

	for i = 1, #simplex do
		local j = i % #simplex + 1
		local v_i = (simplex[i] :: Vector3)
		local v_j = (simplex[j] :: Vector3)
		local edge = v_j - v_i
		local cross = edge:Cross((simplex[#simplex] :: Vector3))
		if cross.Magnitude < EPSILON then
			cross = Vector3.new(0, 1, 0)
		end
		local normal = cross.Unit
		local distance = normal:Dot(v_i)
		table.insert(faces, { normal = normal, edge = edge, distance = distance } :: Face)
	end

	for _ = 1, 64 do
		local minFaceIndex = 1
		local minDistance = faces[1].distance

		for i = 2, #faces do
			if faces[i].distance < minDistance then
				minFaceIndex = i
				minDistance = faces[i].distance
			end
		end

		local direction = faces[minFaceIndex].normal
		local support = MathUtils.gjkSupport(shapeA, shapeB, direction)
		local distance = direction:Dot(support)

		if distance - minDistance < EPSILON then
			return minDistance, direction
		end

		local newFaces: { Face } = {}
		local minFace = faces[minFaceIndex]
		local minEdge = minFace.edge

		for i = 1, #simplex do
			local j = i % #simplex + 1
			local v_i = (simplex[i] :: Vector3)
			local v_j = (simplex[j] :: Vector3)
			local edge = v_j - v_i
			local cross = edge:Cross(support)
			if cross.Magnitude < EPSILON then
				cross = Vector3.new(0, 1, 0)
			end
			local normal = cross.Unit
			local dist = normal:Dot(v_i)
			table.insert(newFaces, { normal = normal, edge = edge, distance = dist } :: Face)
		end

		for i = 1, #newFaces do
			if newFaces[i].distance > 0 then
				table.insert(faces, newFaces[i])
			end
		end

		table.remove(faces, (minFaceIndex))
	end

	return 0, Vector3.zero
end

function MathUtils.quickHull3D(points: { Vector3 }): { Vector3 }
	if #points < 4 then
		return points
	end

	local function findExtremePoints(): (Vector3, Vector3, Vector3, Vector3, Vector3, Vector3)
		local minX, maxX, minY, maxY, minZ, maxZ = points[1], points[1], points[1], points[1], points[1], points[1]
		for _, p in points do
			if p.X < minX.X then minX = p end
			if p.X > maxX.X then maxX = p end
			if p.Y < minY.Y then minY = p end
			if p.Y > maxY.Y then maxY = p end
			if p.Z < minZ.Z then minZ = p end
			if p.Z > maxZ.Z then maxZ = p end
		end
		return minX, maxX, minY, maxY, minZ, maxZ
	end

	local minX, maxX, minY, maxY, minZ, maxZ = findExtremePoints()

	local dist1 = (maxX - minX).Magnitude
	local dist2 = (maxY - minY).Magnitude
	local dist3 = (maxZ - minZ).Magnitude

	local p1, p2
	if dist1 >= dist2 and dist1 >= dist3 then
		p1, p2 = minX, maxX
	elseif dist2 >= dist1 and dist2 >= dist3 then
		p1, p2 = minY, maxY
	else
		p1, p2 = minZ, maxZ
	end

	local p3: Vector3 = Vector3.zero
	local maxDist = 0
	for _, p in points do
		local dist = (p - p1):Cross(p - p2).Magnitude
		if dist > maxDist then
			maxDist = dist
			p3 = p
		end
	end

	local p4: Vector3 = Vector3.zero
	maxDist = 0
	for _, p in points do
		local normal = (p2 - p1):Cross(p3 - p1)
		local dist = math.abs(normal:Dot(p - p1))
		if dist > maxDist then
			maxDist = dist
			p4 = p
		end
	end

	local hull: { Vector3 } = { p1, p2, p3, p4 }
	return hull
end

type Triangle2D = { [number]: Vector2 }

function MathUtils.delaunayTriangulation(points: { Vector2 }): { Triangle2D }
	if #points < 3 then
		return {}
	end

	local superTriangle = {
		Vector2.new(-10000, -10000),
		Vector2.new(10000, -10000),
		Vector2.new(0, 10000)
	}

	local triangles: { Triangle2D } = { superTriangle }

	for _, point in points do
		local badTriangles: { Triangle2D } = {}

		for _, triangle in triangles do
			local circumcenter = MathUtils.circumcenter(triangle[1], triangle[2], triangle[3])
			local radius = (circumcenter - triangle[1]).Magnitude
			if (point - circumcenter).Magnitude < radius then
				table.insert(badTriangles, triangle)
			end
		end

		local polygon: { Vector2 } = {}
		for _, triangle in badTriangles do
			local edges = {
				{ (triangle[1] :: Vector2), (triangle[2] :: Vector2) },
				{ (triangle[2] :: Vector2), (triangle[3] :: Vector2) },
				{ (triangle[3] :: Vector2), (triangle[1] :: Vector2) }
			}

			for _, edge in edges do
				local shared = false
				for _, otherTriangle in badTriangles do
					local otherEdges = {
						{ (otherTriangle[1] :: Vector2), (otherTriangle[2] :: Vector2) },
						{ (otherTriangle[2] :: Vector2), (otherTriangle[3] :: Vector2) },
						{ (otherTriangle[3] :: Vector2), (otherTriangle[1] :: Vector2) }
					}
					for _, otherEdge in otherEdges do
						if (edge[1] == otherEdge[1] and edge[2] == otherEdge[2]) or
							(edge[1] == otherEdge[2] and edge[2] == otherEdge[1]) then
							shared = true
							break
						end
					end
					if shared then break end
				end
				if not shared then
					table.insert(polygon, edge[1])
					table.insert(polygon, edge[2])
				end
			end
		end

		local newTriangles: { Triangle2D } = {}
		for i = 1, #polygon, 2 do
			table.insert(newTriangles, { polygon[i] :: Vector2, polygon[i + 1] :: Vector2, point } :: Triangle2D)
		end

		local remainingTriangles: { Triangle2D } = {}
		for _, triangle in triangles do
			local isBad = false
			for _, badTriangle in badTriangles do
				if triangle == badTriangle then
					isBad = true
					break
				end
			end
			if not isBad then
				table.insert(remainingTriangles, triangle)
			end
		end

		triangles = remainingTriangles
		for _, newTriangle in newTriangles do
			table.insert(triangles, newTriangle)
		end
	end

	local result: { Triangle2D } = {}
	for _, triangle in triangles do
		local usesSuper = false
		for _, vertex in triangle do
			for _, superVertex in superTriangle do
				if vertex == superVertex then
					usesSuper = true
					break
				end
			end
			if usesSuper then break end
		end
		if not usesSuper then
			table.insert(result, triangle)
		end
	end

	return result
end

function MathUtils.circumcenter(a: Vector2, b: Vector2, c: Vector2): Vector2
	local d = 2 * (a.X * (b.Y - c.Y) + b.X * (c.Y - a.Y) + c.X * (a.Y - b.Y))
	if math.abs(d) < EPSILON then
		return (a + b + c) / 3
	end

	local ux = ((a.X * a.X + a.Y * a.Y) * (b.Y - c.Y) + (b.X * b.X + b.Y * b.Y) * (c.Y - a.Y) + (c.X * c.X + c.Y * c.Y) * (a.Y - b.Y)) / d
	local uy = ((a.X * a.X + a.Y * a.Y) * (c.X - b.X) + (b.X * b.X + b.Y * b.Y) * (a.X - c.X) + (c.X * c.X + c.Y * c.Y) * (b.X - a.X)) / d

	return Vector2.new(ux, uy)
end

function MathUtils.sutherlandHodgmanClip(subjectPolygon: { Vector2 }, clipPolygon: { Vector2 }): { Vector2 }
	local outputList = subjectPolygon

	for cpIndex = 1, #clipPolygon do
		local cp1 = clipPolygon[cpIndex]
		local cp2 = clipPolygon[cpIndex % #clipPolygon + 1]

		local inputList = outputList
		outputList = {}

		if #inputList == 0 then
			break
		end

		for sIndex = 1, #inputList do
			local s = inputList[sIndex]
			local e = inputList[sIndex % #inputList + 1]

			if MathUtils.isInside(e, cp1, cp2) then
				if not MathUtils.isInside(s, cp1, cp2) then
					table.insert(outputList, MathUtils.intersection(s, e, cp1, cp2))
				end
				table.insert(outputList, e)
			elseif MathUtils.isInside(s, cp1, cp2) then
				table.insert(outputList, MathUtils.intersection(s, e, cp1, cp2))
			end
		end
	end

	return outputList
end

function MathUtils.isInside(p: Vector2, cp1: Vector2, cp2: Vector2): boolean
	return (cp2.X - cp1.X) * (p.Y - cp1.Y) > (cp2.Y - cp1.Y) * (p.X - cp1.X)
end

function MathUtils.intersection(s: Vector2, e: Vector2, cp1: Vector2, cp2: Vector2): Vector2
	local dc = cp1 - cp2
	local dp = s - e
	local n1 = cp1.X * cp2.Y - cp1.Y * cp2.X
	local n2 = s.X * e.Y - s.Y * e.X
	local n3 = 1 / (dc.X * dp.Y - dc.Y * dp.X)
	return Vector2.new((n1 * dp.X - n2 * dc.X) * n3, (n1 * dp.Y - n2 * dc.Y) * n3)
end

function MathUtils.polygonSelfIntersection(points: { Vector2 }): boolean
	local n = #points
	for i = 1, n do
		local p1 = points[i]
		local p2 = points[i % n + 1]
		for j = i + 2, n do
			local q1 = points[j]
			local q2 = points[j % n + 1]
			if j == n and i == 1 then
			else
				if MathUtils.segmentsIntersect(p1, p2, q1, q2) then
					return true
				end
			end
		end
	end
	return false
end

function MathUtils.segmentsIntersect(p1: Vector2, p2: Vector2, q1: Vector2, q2: Vector2): boolean
	local function ccw(a: Vector2, b: Vector2, c: Vector2): boolean
		return (c.Y - a.Y) * (b.X - a.X) > (b.Y - a.Y) * (c.X - a.X)
	end

	return ccw(p1, q1, q2) ~= ccw(p2, q1, q2) and ccw(p1, p2, q1) ~= ccw(p1, p2, q2)
end

type ButterworthFilterState = { x1: number, x2: number, y1: number, y2: number }
type BandpassFilterState = { x1: number, x2: number, y1: number, y2: number, hp1: number, hp2: number }
type NotchFilterState = { x1: number, x2: number, y1: number, y2: number }

function MathUtils.butterworthLowpass2ndOrder(cutoff: number, sampleRate: number): (ButterworthFilterState, number) -> (ButterworthFilterState, number)
	local omega = 2 * math.pi * cutoff / sampleRate
	local sinOmega = math.sin(omega)
	local cosOmega = math.cos(omega)
	local alpha = sinOmega / math.sqrt(2)

	local b0 = (1 - cosOmega) / 2
	local b1 = 1 - cosOmega
	local b2 = (1 - cosOmega) / 2
	local a0 = 1 + alpha
	local a1 = -2 * cosOmega
	local a2 = 1 - alpha

	return function(state: ButterworthFilterState, input: number): (ButterworthFilterState, number)
		if state == nil then
			state = { x1 = 0, x2 = 0, y1 = 0, y2 = 0 }
		end

		local output = (b0 * input + b1 * state.x1 + b2 * state.x2 - a1 * state.y1 - a2 * state.y2) / a0

		state.x2 = state.x1
		state.x1 = input
		state.y2 = state.y1
		state.y1 = output

		return state, output
	end
end

function MathUtils.bandpassFilter(lowCutoff: number, highCutoff: number, sampleRate: number): (BandpassFilterState, number) -> (BandpassFilterState, number)
	local omegaLow = 2 * math.pi * lowCutoff / sampleRate
	local omegaHigh = 2 * math.pi * highCutoff / sampleRate
	local cosLow = math.cos(omegaLow)
	local cosHigh = math.cos(omegaHigh)
	local alphaLow = math.sin(omegaLow) / math.sqrt(2)
	local alphaHigh = math.sin(omegaHigh) / math.sqrt(2)

	local b0 = alphaHigh
	local b1 = 0
	local b2 = -alphaHigh
	local a0 = 1 + alphaHigh
	local a1 = -2 * cosHigh
	local a2 = 1 - alphaHigh

	local b0Low = (1 - cosLow) / 2
	local b1Low = 1 - cosLow
	local b2Low = (1 - cosLow) / 2
	local a0Low = 1 + alphaLow
	local a1Low = -2 * cosLow
	local a2Low = 1 - alphaLow

	return function(state: BandpassFilterState, input: number): (BandpassFilterState, number)
		if state == nil then
			state = { x1 = 0, x2 = 0, y1 = 0, y2 = 0, hp1 = 0, hp2 = 0 }
		end

		local hp = (b0 * input + b1 * state.x1 + b2 * state.x2 - a1 * state.hp1 - a2 * state.hp2) / a0
		state.hp2 = state.hp1
		state.hp1 = hp

		local output = (b0Low * hp + b1Low * state.hp1 + b2Low * state.hp2 - a1Low * state.y1 - a2Low * state.y2) / a0Low

		state.x2 = state.x1
		state.x1 = input
		state.y2 = state.y1
		state.y1 = output

		return state, output
	end
end

function MathUtils.notchFilter(notchFreq: number, q: number, sampleRate: number): (NotchFilterState, number) -> (NotchFilterState, number)
	local omega = 2 * math.pi * notchFreq / sampleRate
	local cosOmega = math.cos(omega)
	local alpha = math.sin(omega) / (2 * q)

	local b0 = 1
	local b1 = -2 * cosOmega
	local b2 = 1
	local a0 = 1 + alpha
	local a1 = -2 * cosOmega
	local a2 = 1 - alpha

	return function(state: NotchFilterState, input: number): (NotchFilterState, number)
		if state == nil then
			state = { x1 = 0, x2 = 0, y1 = 0, y2 = 0 }
		end

		local output = (b0 * input + b1 * state.x1 + b2 * state.x2 - a1 * state.y1 - a2 * state.y2) / a0

		state.x2 = state.x1
		state.x1 = input
		state.y2 = state.y1
		state.y1 = output

		return state, output
	end
end

type MovingAverageState = { buffer: { [number]: number }, index: number, sum: number }

function MathUtils.movingAverageFilter(windowSize: number): (MovingAverageState, number) -> (MovingAverageState, number)
	return function(state: MovingAverageState, input: number): (MovingAverageState, number)
		if state == nil then
			state = { buffer = table.create(windowSize, 0), index = 1, sum = 0 }
		end

		state.sum = state.sum - state.buffer[state.index] + input
		state.buffer[state.index] = input
		state.index = state.index % windowSize + 1

		return state, state.sum / windowSize
	end
end

type MedianFilterState = { buffer: { [number]: number } }

function MathUtils.medianFilter(windowSize: number): (MedianFilterState, number) -> (MedianFilterState, number)
	return function(state: MedianFilterState, input: number): (MedianFilterState, number)
		if state == nil then
			state = { buffer = table.create(windowSize, 0) }
		end

		table.insert(state.buffer, input)
		if #state.buffer > windowSize then
			table.remove(state.buffer, (1))
		end

		local sorted = table.create(#state.buffer, 0)
		for i, v in state.buffer do
			sorted[i] = v
		end
		table.sort(sorted)

		local median
		if #sorted % 2 == 0 then
			median = (sorted[#sorted / 2] + sorted[#sorted / 2 + 1]) / 2
		else
			median = sorted[math.floor(#sorted / 2) + 1]
		end

		return state, median
	end
end

type KalmanFilter1DState = { x: number, p: number, q: number, r: number }
type KalmanFilterState = { x: VectorN, p: Matrix, q: Matrix, r: Matrix }

function MathUtils.kalmanFilter1D(initialState: number, initialCovariance: number, processNoise: number, measurementNoise: number): (KalmanFilter1DState, number) -> (KalmanFilter1DState, number)
	return function(state: KalmanFilter1DState, measurement: number): (KalmanFilter1DState, number)
		if state == nil then
			state = { x = initialState, p = initialCovariance, q = processNoise, r = measurementNoise }
		end

		state.p = state.p + state.q
		local k = state.p / (state.p + state.r)
		state.x = state.x + k * (measurement - state.x)
		state.p = (1 - k) * state.p

		return state, state.x
	end
end


function MathUtils.kalmanFilter(initialState: VectorN, initialCovariance: Matrix, processNoise: Matrix, measurementNoise: Matrix): (KalmanFilterState, VectorN) -> (KalmanFilterState, VectorN)
	return function(state: KalmanFilterState, measurement: VectorN): (KalmanFilterState, VectorN)
		if state == nil then
			state = { x = initialState, p = initialCovariance, q = processNoise, r = measurementNoise }
		end

		local n = #state.x
		for i = 1, n do
			for j = 1, n do
				state.p[(i - 1) * n + j] = state.p[(i - 1) * n + j] + state.q[(i - 1) * n + j]
			end
		end

		local y: VectorN = table.create(n, 0)
		for i = 1, n do
			y[i] = measurement[i] - state.x[i]
		end

		local s: Matrix = table.create(n * n, 0)
		for i = 1, n do
			for j = 1, n do
				for k = 1, n do
					s[(i - 1) * n + j] = s[(i - 1) * n + j] + state.p[(i - 1) * n + k]
				end
				s[(i - 1) * n + j] = s[(i - 1) * n + j] + state.r[(i - 1) * n + j]
			end
		end

		local k: Matrix = table.create(n * n, 0)
		for i = 1, n do
			for j = 1, n do
				k[(i - 1) * n + j] = state.p[(i - 1) * n + j]
			end
		end

		for i = 1, n do
			state.x[i] = state.x[i] + y[i]
		end

		for i = 1, n do
			for j = 1, n do
				state.p[(i - 1) * n + j] = state.p[(i - 1) * n + j] - k[(i - 1) * n + j]
			end
		end

		return state, state.x
	end
end


function MathUtils.statisticsMean(data: { number }): number
	if #data == 0 then return 0 end
	local sum = 0
	for _, v in data do
		sum = sum + v
	end
	return sum / #data
end

function MathUtils.statisticsVariance(data: { number }): number
	if #data < 2 then return 0 end
	local mean = MathUtils.statisticsMean(data)
	local sum = 0
	for _, v in data do
		sum = sum + (v - mean) ^ 2
	end
	return sum / (#data - 1)
end

function MathUtils.statisticsCovariance(data1: { number }, data2: { number }): number
	if #data1 ~= #data2 or #data1 < 2 then return 0 end
	local mean1 = MathUtils.statisticsMean(data1)
	local mean2 = MathUtils.statisticsMean(data2)
	local sum = 0
	for i = 1, #data1 do
		sum = sum + (data1[i] - mean1) * (data2[i] - mean2)
	end
	return sum / (#data1 - 1)
end

function MathUtils.statisticsPercentile(data: { number }, percentile: number): number
	if #data == 0 then return 0 end
	local sorted = table.create(#data, 0)
	for i, v in data do
		sorted[i] = v
	end
	table.sort(sorted)
	local index = math.ceil(percentile * #sorted)
	return sorted[math.clamp(index, 1, #sorted)]
end

function MathUtils.statisticsKurtosis(data: { number }): number
	if #data < 4 then return 0 end
	local mean = MathUtils.statisticsMean(data)
	local variance = MathUtils.statisticsVariance(data)
	if variance < EPSILON then return 0 end
	local stdDev = math.sqrt(variance)
	local sum = 0
	for _, v in data do
		sum = sum + ((v - mean) / stdDev) ^ 4
	end
	return (sum / #data) - 3
end

function MathUtils.randomNormal(mean: number, stddev: number): number
	local u1 = math.random()
	local u2 = math.random()
	while u1 == 0 do u1 = math.random() end
	local z0 = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
	local z1 = math.sqrt(-2 * math.log(u1)) * math.sin(2 * math.pi * u2)
	return mean + z0 * stddev
end

function MathUtils.randomExponential(lambda: number): number
	return -math.log(1 - math.random()) / lambda
end

function MathUtils.randomUniformOnDisk(): Vector2
	local r = math.sqrt(math.random())
	local theta = 2 * math.pi * math.random()
	return Vector2.new(r * math.cos(theta), r * math.sin(theta))
end

function MathUtils.randomUniformOnSphere(): Vector3
	local u = math.random() * 2 - 1
	local theta = math.random() * 2 * math.pi
	local r = math.sqrt(1 - u * u)
	return Vector3.new(r * math.cos(theta), u, r * math.sin(theta))
end

type AABB = { min: Vector3, max: Vector3 }
type BVHNode = { aabb: AABB, left: BVHNode?, right: BVHNode?, primitiveIndex: number? }
type OctreeNode = { center: Vector3, halfSize: Vector3, children: { [number]: OctreeNode? }, points: { [number]: Vector3 } }


function MathUtils.createBVH(primitives: { AABB }): BVHNode?
	if #primitives == 0 then
		return nil
	end

	if #primitives == 1 then
		return {
			aabb = primitives[1],
			left = nil,
			right = nil,
			primitiveIndex = 1
		}
	end

	local function combineAABB(a: AABB, b: AABB): AABB
		return {
			min = Vector3.new(
				math.min(a.min.X, b.min.X),
				math.min(a.min.Y, b.min.Y),
				math.min(a.min.Z, b.min.Z)
			),
			max = Vector3.new(
				math.max(a.max.X, b.max.X),
				math.max(a.max.Y, b.max.Y),
				math.max(a.max.Z, b.max.Z)
			)
		}
	end

	local function aabbSurfaceArea(aabb: AABB): number
		local d = aabb.max - aabb.min
		return 2 * (d.X * d.Y + d.Y * d.Z + d.Z * d.X)
	end

	local function buildBVH(primitives: { AABB }, start: number, finish: number): BVHNode
		if start == finish then
			return {
				aabb = primitives[start],
				left = nil,
				right = nil,
				primitiveIndex = start
			}
		end

		if finish - start == 1 then
			return {
				aabb = combineAABB(primitives[start], primitives[finish]),
				left = buildBVH(primitives, start, start),
				right = buildBVH(primitives, finish, finish),
				primitiveIndex = nil
			}
		end

		local centroid = Vector3.zero
		for i = start, finish do
			centroid = centroid + (primitives[i].min + primitives[i].max) * 0.5
		end
		centroid = centroid / (finish - start + 1)

		local splitAxis = 1
		if centroid.Y > centroid.X and centroid.Y > centroid.Z then
			splitAxis = 2
		elseif centroid.Z > centroid.X and centroid.Z > centroid.Y then
			splitAxis = 3
		end

		local mid = math.floor((start + finish) / 2)
		local function compareAABB(a: AABB, b: AABB): boolean
			local ca = (a.min + a.max) * 0.5
			local cb = (b.min + b.max) * 0.5
			if splitAxis == 1 then
				return ca.X < cb.X
			elseif splitAxis == 2 then
				return ca.Y < cb.Y
			else
				return ca.Z < cb.Z
			end
		end

		local sorted: { AABB } = table.create(finish - start + 1) :: { AABB }
		for i = start, finish do
			sorted[i - start + 1] = primitives[i]
		end
		table.sort(sorted, compareAABB)

		for i = start, finish do
			primitives[i] = sorted[i - start + 1]
		end

		local left = buildBVH(primitives, start, mid)
		local right = buildBVH(primitives, mid + 1, finish)

		return {
			aabb = combineAABB(left.aabb, right.aabb),
			left = left,
			right = right,
			primitiveIndex = nil
		}
	end

	return buildBVH(primitives, 1, #primitives)
end

function MathUtils.bvhRaycast(bvh: BVHNode, origin: Vector3, direction: Vector3): (boolean, number, number?)
	if bvh == nil then
		return false, 0, nil
	end

	local function rayAABB(aabb: AABB, origin: Vector3, direction: Vector3): (boolean, number, number?)
		local tMin = 0
		local tMax = math.huge

		local function getComponent(v: Vector3, i: number): number
			if i == 1 then return v.X end
			if i == 2 then return v.Y end
			return v.Z
		end

		for i = 1, 3 do
			local minVal = getComponent(aabb.min, i)
			local maxVal = getComponent(aabb.max, i)
			local dirVal = getComponent(direction, i)
			local originVal = getComponent(origin, i)

			if math.abs(dirVal) < EPSILON then
				if originVal < minVal or originVal > maxVal then
					return false, 0, 0
				end
			else
				local t1 = (minVal - originVal) / dirVal
				local t2 = (maxVal - originVal) / dirVal

				if t1 > t2 then
					t1, t2 = t2, t1
				end

				tMin = math.max(tMin, t1)
				tMax = math.min(tMax, t2)

				if tMin > tMax then
					return false, 0, 0
				end
			end
		end

		return true, tMin, tMax
	end

	local function traverse(node: BVHNode): (boolean, number, number?)
		local hit, tMin, tMax = rayAABB(node.aabb, origin, direction)
		if not hit then
			return false, 0, nil
		end

		if node.primitiveIndex ~= nil then
			return true, tMin, node.primitiveIndex :: number
		end

		local leftHit, leftT, leftIndex = traverse(node.left :: BVHNode)
		local rightHit, rightT, rightIndex = traverse(node.right :: BVHNode)

		if leftHit and rightHit then
			if (leftT :: number) < (rightT :: number) then
				return true, leftT, leftIndex :: number?
			else
				return true, rightT, rightIndex :: number?
			end
		elseif leftHit then
			return true, leftT, leftIndex :: number?
		elseif rightHit then
			return true, rightT, rightIndex :: number?
		else
			return false, 0, nil
		end
	end

	return traverse(bvh)
end



function MathUtils.createOctree(points: { Vector3 }, maxDepth: number, maxPointsPerNode: number): OctreeNode
	local function build(points: { Vector3 }, center: Vector3, halfSize: Vector3, depth: number): OctreeNode
		local node: OctreeNode = {
			center = center,
			halfSize = halfSize,
			children = { nil, nil, nil, nil, nil, nil, nil, nil },
			points = {}
		}

		if depth >= maxDepth or #points <= maxPointsPerNode then
			node.points = points
			return node
		end

		local octants: { { Vector3 } } = { {}, {}, {}, {}, {}, {}, {}, {} }
		for _, point in points do
			local index = 0
			if point.X > center.X then index = index + 1 end
			if point.Y > center.Y then index = index + 2 end
			if point.Z > center.Z then index = index + 4 end
			table.insert(octants[index + 1], point)
		end

		local childHalfSize = halfSize * 0.5
		local offsets = {
			Vector3.new(-1, -1, -1),
			Vector3.new(1, -1, -1),
			Vector3.new(-1, 1, -1),
			Vector3.new(1, 1, -1),
			Vector3.new(-1, -1, 1),
			Vector3.new(1, -1, 1),
			Vector3.new(-1, 1, 1),
			Vector3.new(1, 1, 1)
		}

		for i = 1, 8 do
			if #octants[i] > 0 then
				node.children[i] = build(octants[i], center + offsets[i] * childHalfSize, childHalfSize, depth + 1)
			end
		end

		return node
	end

	local min = points[1]
	local max = points[1]
	for _, p in points do
		min = Vector3.new(math.min(min.X, p.X), math.min(min.Y, p.Y), math.min(min.Z, p.Z))
		max = Vector3.new(math.max(max.X, p.X), math.max(max.Y, p.Y), math.max(max.Z, p.Z))
	end

	local center = (min + max) * 0.5
	local halfSize = (max - min) * 0.5

	return build(points, center, halfSize, 0)
end

function MathUtils.octreeRangeQuery(node: OctreeNode, center: Vector3, radius: number, results: { Vector3 }): { Vector3 }
	if node == nil then
		return results or {}
	end

	results = results or {}

	local function aabbIntersectsSphere(nodeCenter: Vector3, nodeHalfSize: Vector3, sphereCenter: Vector3, sphereRadius: number): boolean
		local closest = Vector3.new(
			math.max(nodeCenter.X - nodeHalfSize.X, math.min(sphereCenter.X, nodeCenter.X + nodeHalfSize.X)),
			math.max(nodeCenter.Y - nodeHalfSize.Y, math.min(sphereCenter.Y, nodeCenter.Y + nodeHalfSize.Y)),
			math.max(nodeCenter.Z - nodeHalfSize.Z, math.min(sphereCenter.Z, nodeCenter.Z + nodeHalfSize.Z))
		)
		return (closest - sphereCenter).Magnitude <= sphereRadius
	end

	if not aabbIntersectsSphere(node.center, node.halfSize, center, radius) then
		return results
	end

	if #node.points > 0 then
		for _, point in node.points do
			if (point - center).Magnitude <= radius then
				table.insert(results, point)
			end
		end
	else
		for _, child in node.children do
			if child ~= nil then
				MathUtils.octreeRangeQuery(child, center, radius, results)
			end
		end
	end

	return results
end

type KDNode = { point: Vector3, left: KDNode?, right: KDNode?, axis: number }

function MathUtils.createKDTree(points: { Vector3 }, depth: number): KDNode?
	if #points == 0 then
		return nil
	end

	if #points == 1 then
		return {
			point = points[1],
			left = nil,
			right = nil,
			axis = depth % 3
		}
	end

	local axis = depth % 3
	local axisNames: { [number]: string } = { "X", "Y", "Z" }

	local function comparePoints(a: Vector3, b: Vector3): boolean
		if axis == 0 then
			return a.X < b.X
		elseif axis == 1 then
			return a.Y < b.Y
		else
			return a.Z < b.Z
		end
	end

	local sorted: { Vector3 } = table.create(#points) :: { Vector3 }
	for i, p in points do
		sorted[i] = p
	end
	table.sort(sorted, comparePoints)

	local median = math.floor(#sorted / 2)
	local leftPoints: { Vector3 } = table.create(median) :: { Vector3 }
	local rightPoints: { Vector3 } = table.create(#sorted - median - 1) :: { Vector3 }

	for i = 1, median do
		leftPoints[i] = sorted[i]
	end
	for i = median + 2, #sorted do
		rightPoints[i - median - 1] = sorted[i]
	end

	return {
		point = sorted[median + 1],
		left = MathUtils.createKDTree(leftPoints, depth + 1),
		right = MathUtils.createKDTree(rightPoints, depth + 1),
		axis = axis
	}
end

function MathUtils.kdTreeNearestNeighbor(node: KDNode?, query: Vector3, depth: number, best: Vector3?, bestDist: number): (Vector3, number)
	if node == nil then
		return (best or Vector3.zero) :: Vector3, bestDist or math.huge
	end

	local dist = (node.point - query).Magnitude
	if dist < bestDist then
		best = node.point
		bestDist = dist
	end

	local axis = depth % 3

	local diff: number = 0
	if axis == 0 then
		diff = query.X - node.point.X
	elseif axis == 1 then
		diff = query.Y - node.point.Y
	else
		diff = query.Z - node.point.Z
	end

	local near, far
	if diff < 0 then
		near = node.left
		far = node.right
	else
		near = node.right
		far = node.left
	end

	best, bestDist = MathUtils.kdTreeNearestNeighbor(near, query, depth + 1, best, bestDist)

	if diff * diff < bestDist then
		best, bestDist = MathUtils.kdTreeNearestNeighbor(far, query, depth + 1, best, bestDist)
	end

	return (best or Vector3.zero) :: Vector3, bestDist
end

type DistancePoint = { dist: number, point: Vector3 }

function MathUtils.kNearestNeighbors(points: { Vector3 }, query: Vector3, k: number): { Vector3 }
	if #points == 0 or k <= 0 then
		return {}
	end

	k = math.min(k, #points)
	local distances: { DistancePoint } = {}

	for _, point in points do
		local dist = (point - query).Magnitude
		table.insert(distances, { dist = dist, point = point })
	end

	local function compare(a: DistancePoint, b: DistancePoint): boolean
		return a.dist < b.dist
	end
	table.sort(distances, compare)

	local result: { Vector3 } = {}
	for i = 1, k do
		table.insert(result, distances[i].point)
	end

	return result
end

function MathUtils.rangeQuery(points: { Vector3 }, center: Vector3, radius: number): { Vector3 }
	local result: { Vector3 } = {}

	for _, point in points do
		if (point - center).Magnitude <= radius then
			table.insert(result, point)	
		end
	end

	return result
end

function MathUtils.jacobiEigenvalues3x3(
	m11: number, m12: number, m13: number,
	m22: number, m23: number,
	m33: number
): (number, number, number, Vector3, Vector3, Vector3)
	local a = { m11, m12, m13, m12, m22, m23, m13, m23, m33 }
	local v = { 1, 0, 0, 0, 1, 0, 0, 0, 1 }

	for _ = 1, 50 do
		local p, q = 1, 2
		local maxVal: number = math.abs(a[2] :: number)
		if math.abs(a[3] :: number) > maxVal then
			p, q = 1, 3
			maxVal = math.abs(a[3] :: number)
		end
		if math.abs(a[6] :: number) > maxVal then
			p, q = 2, 3
		end

		if math.abs(a[(p - 1) * 3 + q]) < 1e-12 then
			break
		end

		local app = a[(p - 1) * 3 + p]
		local aqq = a[(q - 1) * 3 + q]
		local apq = a[(p - 1) * 3 + q]

		local phi = 0.5 * math.atan2(2 * apq, aqq - app)
		local c = math.cos(phi)
		local s = math.sin(phi)

		for i = 1, 3 do
			local ip = (i - 1) * 3 + p
			local iq = (i - 1) * 3 + q
			local aip = a[ip]
			local aiq = a[iq]
			a[ip] = c * aip - s * aiq
			a[iq] = s * aip + c * aiq
		end

		for i = 1, 3 do
			local pi = (p - 1) * 3 + i
			local qi = (q - 1) * 3 + i
			local api = a[pi]
			local aqi = a[qi]
			a[pi] = c * api - s * aqi
			a[qi] = s * api + c * aqi
		end

		for i = 1, 3 do
			local ip = (i - 1) * 3 + p
			local iq = (i - 1) * 3 + q
			local vip = v[ip]
			local viq = v[iq]
			v[ip] = c * vip - s * viq
			v[iq] = s * vip + c * viq
		end
	end

	local e1 = a[1]
	local e2 = a[5]
	local e3 = a[9]

	local vec1 = Vector3.new(v[1], v[4], v[7]).Unit
	local vec2 = Vector3.new(v[2], v[5], v[8]).Unit
	local vec3 = Vector3.new(v[3], v[6], v[9]).Unit

	return e1, e2, e3, vec1, vec2, vec3
end

function MathUtils.conservativeAdvancement(
	shapeA: SupportFunction,
	shapeB: SupportFunction,
	transformA0: CFrame,
	transformA1: CFrame,
	transformB0: CFrame,
	transformB1: CFrame,
	maxIterations: number?
): (boolean, number, Vector3)
	local maxIter = maxIterations or 32
	local t = 0

	for _ = 1, maxIter do
		local interpA = transformA0:Lerp(transformA1, t)
		local interpB = transformB0:Lerp(transformB1, t)

		local localA = function(direction: Vector3): Vector3
			return interpA.Position + interpA:VectorToWorldSpace(shapeA(interpA:VectorToObjectSpace(direction)))
		end
		local localB = function(direction: Vector3): Vector3
			return interpB.Position + interpB:VectorToWorldSpace(shapeB(interpB:VectorToObjectSpace(direction)))
		end

		local hit, simplex = MathUtils.gjkCollision(localA, localB)
		if hit then
			if #simplex >= 3 then
				local _, normal = MathUtils.epaPenetration(localA, localB, simplex)
				return true, t, normal
			else
				local normal = (interpA.Position - interpB.Position).Unit
				if normal.Magnitude < EPSILON then
					normal = Vector3.xAxis
				end
				return true, t, normal
			end
		end

		local dist = math.huge
		local n = #simplex
		if n >= 3 then
			dist = MathUtils.closestPointOnTriangle(Vector3.zero, simplex[1], simplex[2], simplex[3]).Magnitude
		elseif n == 2 then
			dist = MathUtils.closestPointOnSegment(Vector3.zero, simplex[1], simplex[2]).Magnitude
		elseif n == 1 then
			dist = simplex[1].Magnitude
		end

		local velA = (transformA1.Position - transformA0.Position).Magnitude
		local velB = (transformB1.Position - transformB0.Position).Magnitude
		local angularA = math.acos(math.clamp(transformA0:VectorToObjectSpace(transformA1.LookVector):Dot(Vector3.zAxis), -1, 1))
		local angularB = math.acos(math.clamp(transformB0:VectorToObjectSpace(transformB1.LookVector):Dot(Vector3.zAxis), -1, 1))

		local maxRadiusA = (localA(Vector3.xAxis) - interpA.Position).Magnitude
		local maxRadiusB = (localB(Vector3.xAxis) - interpB.Position).Magnitude
		local maxSpeed = velA + velB + angularA * maxRadiusA + angularB * maxRadiusB
		maxSpeed = math.max(maxSpeed, EPSILON)

		local step = dist / maxSpeed
		if step < 1e-7 then
			return false, t, Vector3.zero
		end

		local newT = t + step
		if newT > 1 then
			return false, 1, Vector3.zero
		end
		t = newT
	end

	return false, 1, Vector3.zero
end

type SkeletonEdge = { a: Vector2, b: Vector2 }

function MathUtils.straightSkeleton2D(polygon: { Vector2 }): { SkeletonEdge }
	local n = #polygon
	if n < 3 then
		return {}
	end

	local edges: { SkeletonEdge } = {}

	local function polygonArea(): number
		local area = 0
		for i = 1, n do
			local j = i % n + 1
			area += polygon[i].X * polygon[j].Y - polygon[j].X * polygon[i].Y
		end
		return area * 0.5
	end

	if polygonArea() < 0 then
		local rev: { Vector2 } = {}
		for i = n, 1, -1 do
			table.insert(rev, polygon[i])
		end
		polygon = rev
	end

	local function insetPolygon(poly: { Vector2 }, offset: number): { Vector2 }
		local m = #poly
		local result: { Vector2 } = {}
		for i = 1, m do
			local prev = poly[(i - 2 + m) % m + 1]
			local curr = poly[i]
			local next = poly[i % m + 1]

			local e1 = (curr - prev).Unit
			local e2 = (next - curr).Unit
			local n1 = Vector2.new(-e1.Y, e1.X)
			local n2 = Vector2.new(-e2.Y, e2.X)

			local bisector = (n1 + n2).Unit
			if bisector.Magnitude < EPSILON then
				bisector = n1
			end

			table.insert(result, curr + bisector * offset)
		end
		return result
	end

	local currentPoly = polygon
	local prevPoly = polygon
	local maxSteps = 20
	local totalOffset = 0

	for step = 1, maxSteps do
		local offset = 0.1
		local inset = insetPolygon(currentPoly, offset)
		totalOffset += offset

		local insetN = #inset
		if insetN < 3 then
			break
		end

		local valid = true
		for i = 1, insetN do
			local a = inset[i]
			local b = inset[i % insetN + 1]
			if (b - a).Magnitude < EPSILON then
				valid = false
				break
			end
		end
		if not valid then
			break
		end

		for i = 1, insetN do
			local prevIdx = i % insetN + 1
			if prevIdx <= #prevPoly then
				table.insert(edges, { a = prevPoly[prevIdx], b = inset[i] })
			end
		end

		prevPoly = inset
		currentPoly = inset

		local area = 0
		for i = 1, insetN do
			local j = i % insetN + 1
			area += inset[i].X * inset[j].Y - inset[j].X * inset[i].Y
		end
		if math.abs(area) < 0.01 then
			break
		end
	end

	return edges
end

type ComplexNumber = { re: number, im: number }

function MathUtils.fft(signal: { ComplexNumber }): { ComplexNumber }
	local n = #signal
	if n <= 1 then
		return signal
	end

	if n % 2 ~= 0 then
		error("FFT input length must be a power of 2")
	end

	local even: { ComplexNumber } = {}
	local odd: { ComplexNumber } = {}
	for i = 1, n do
		if i % 2 == 1 then
			table.insert(even, signal[i])
		else
			table.insert(odd, signal[i])
		end
	end

	local evenFFT = MathUtils.fft(even)
	local oddFFT = MathUtils.fft(odd)

	local result: { ComplexNumber } = {}
	for _ = 1, n do
		table.insert(result, { re = 0, im = 0 })
	end
	for k = 1, n / 2 do
		local angle = -2 * math.pi * (k - 1) / n
		local twiddle = { re = math.cos(angle), im = math.sin(angle) }

		local tRe = twiddle.re * oddFFT[k].re - twiddle.im * oddFFT[k].im
		local tIm = twiddle.re * oddFFT[k].im + twiddle.im * oddFFT[k].re
		local t = { re = tRe, im = tIm }

		result[k] = { re = evenFFT[k].re + t.re, im = evenFFT[k].im + t.im }
		result[k + n / 2] = { re = evenFFT[k].re - t.re, im = evenFFT[k].im - t.im }
	end

	return result
end

function MathUtils.ifft(signal: { ComplexNumber }): { ComplexNumber }
	local n = #signal
	local conjugated: { ComplexNumber } = {}
	for i = 1, n do
		table.insert(conjugated, { re = signal[i].re, im = -signal[i].im })
	end

	local transformed = MathUtils.fft(conjugated)
	local result: { ComplexNumber } = {}
	for i = 1, n do
		table.insert(result, { re = transformed[i].re / n, im = -transformed[i].im / n })
	end

	return result
end

function MathUtils.fnv1aHash32(str: string): number
	local hash = 2166136261
	for i = 1, #str do
		hash = bit32.bxor(hash, string.byte(str, i))
		hash = (hash * 16777619) % 2 ^ 32
	end
	return hash
end

function MathUtils.djb2Hash(str: string): number
	local hash = 5381
	for i = 1, #str do
		hash = bit32.lshift(hash, 5) + hash + string.byte(str, i)
	end
	return hash % 2 ^ 32
end

function MathUtils.sdbmHash(str: string): number
	local hash = 0
	for i = 1, #str do
		hash = string.byte(str, i) + bit32.lshift(hash, 6) + bit32.lshift(hash, 16) - hash
	end
	return hash % 2 ^ 32
end

function MathUtils.popcount32(x: number): number
	x = bit32.band(x, 0xFFFFFFFF)
	local c = 0
	while x > 0 do
		x = bit32.band(x, x - 1)
		c += 1
	end
	return c
end

function MathUtils.bitReverse32(x: number): number
	x = bit32.band(x, 0xFFFFFFFF)
	x = bit32.bor(bit32.lshift(bit32.band(x, 0x55555555), 1), bit32.rshift(bit32.band(x, 0xAAAAAAAA), 1))
	x = bit32.bor(bit32.lshift(bit32.band(x, 0x33333333), 2), bit32.rshift(bit32.band(x, 0xCCCCCCCC), 2))
	x = bit32.bor(bit32.lshift(bit32.band(x, 0x0F0F0F0F), 4), bit32.rshift(bit32.band(x, 0xF0F0F0F0), 4))
	x = bit32.bor(bit32.lshift(bit32.band(x, 0x00FF00FF), 8), bit32.rshift(bit32.band(x, 0xFF00FF00), 8))
	return bit32.bor(bit32.lshift(x, 16), bit32.rshift(x, 16))
end

function MathUtils.setUnionSorted(a: { number }, b: { number }): { number }
	local i, j = 1, 1
	local result: { number } = {}
	while i <= #a and j <= #b do
		if a[i] < b[j] then
			table.insert(result, a[i])
			i += 1
		elseif a[i] > b[j] then
			table.insert(result, b[j])
			j += 1
		else
			table.insert(result, a[i])
			i += 1
			j += 1
		end
	end
	while i <= #a do
		table.insert(result, a[i])
		i += 1
	end
	while j <= #b do
		table.insert(result, b[j])
		j += 1
	end
	return result
end

function MathUtils.setIntersectionSorted(a: { number }, b: { number }): { number }
	local i, j = 1, 1
	local result: { number } = {}
	while i <= #a and j <= #b do
		if a[i] < b[j] then
			i += 1
		elseif a[i] > b[j] then
			j += 1
		else
			table.insert(result, a[i])
			i += 1
			j += 1
		end
	end
	return result
end

function MathUtils.setDifferenceSorted(a: { number }, b: { number }): { number }
	local i, j = 1, 1
	local result: { number } = {}
	while i <= #a and j <= #b do
		if a[i] < b[j] then
			table.insert(result, a[i])
			i += 1
		elseif a[i] > b[j] then
			j += 1
		else
			i += 1
			j += 1
		end
	end
	while i <= #a do
		table.insert(result, a[i])
		i += 1
	end
	return result
end

function MathUtils.intervalAdd(a: number, b: number, c: number, d: number): (number, number)
	return a + c, b + d
end

function MathUtils.intervalSubtract(a: number, b: number, c: number, d: number): (number, number)
	return a - d, b - c
end

function MathUtils.intervalMultiply(a: number, b: number, c: number, d: number): (number, number)
	local products = { a * c, a * d, b * c, b * d }
	local minVal = math.min(unpack(products))
	local maxVal = math.max(unpack(products))
	return minVal, maxVal
end

function MathUtils.intervalUnion(a: number, b: number, c: number, d: number): (number, number)
	return math.min(a, c), math.max(b, d)
end

function MathUtils.intervalIntersect(a: number, b: number, c: number, d: number): (number?, number?)
	if b < c or d < a then return nil, nil end
	return math.max(a, c), math.min(b, d)
end

function MathUtils.intervalContains(a: number, b: number, x: number): boolean
	return x >= a and x <= b
end

function MathUtils.intervalOverlap(a: number, b: number, c: number, d: number): boolean
	return not (b < c or d < a)
end

function MathUtils.topologicalSort(vertices: { string }, edges: { { string } }): ({ string }, boolean)
	local adj: { [string]: { string } } = {}
	local inDegree: { [string]: number } = {}
	for _, v in ipairs(vertices) do
		adj[v] = {}
		inDegree[v] = 0
	end
	for _, e in ipairs(edges) do
		local u, v = e[1], e[2]
		table.insert(adj[u], v)
		inDegree[v] = (inDegree[v] or 0) + 1
	end
	local queue: { string } = {}
	for _, v in ipairs(vertices) do
		if inDegree[v] == 0 then
			table.insert(queue, v)
		end
	end
	local result: { string } = {}
	local index = 1
	while index <= #queue do
		local u = queue[index]
		index += 1
		table.insert(result, u)
		for _, v in ipairs(adj[u]) do
			inDegree[v] -= 1
			if inDegree[v] == 0 then
				table.insert(queue, v)
			end
		end
	end
	return result, #result == #vertices
end

function MathUtils.stronglyConnectedComponents(vertices: { string }, edges: { { string } }): { { string } }
	local adj: { [string]: { string } } = {}
	local radj: { [string]: { string } } = {}
	for _, v in ipairs(vertices) do
		adj[v] = {}
		radj[v] = {}
	end
	for _, e in ipairs(edges) do
		local u, v = e[1], e[2]
		table.insert(adj[u], v)
		table.insert(radj[v], u)
	end
	local visited: { [string]: boolean } = {}
	local order: { string } = {}
	local function dfs1(u: string)
		visited[u] = true
		for _, v in ipairs(adj[u]) do
			if not visited[v] then
				dfs1(v)
			end
		end
		table.insert(order, u)
	end
	for _, v in ipairs(vertices) do
		if not visited[v] then
			dfs1(v)
		end
	end
	local component: { string } = {}
	local sccs: { { string } } = {}
	local function dfs2(u: string)
		visited[u] = true
		table.insert(component, u)
		for _, v in ipairs(radj[u]) do
			if not visited[v] then
				dfs2(v)
			end
		end
	end
	for i = 1, #vertices do
		visited[vertices[i]] = false
	end
	for i = #order, 1, -1 do
		local v = order[i]
		if not visited[v] then
			component = {}
			dfs2(v)
			table.insert(sccs, component)
		end
	end
	return sccs
end

function MathUtils.dijkstra(startNode: string, edges: { { string } }, weights: { [string]: number }): { [string]: number }
	local dist: { [string]: number } = {}
	local heap: { { string | number } } = {}
	local heapSize = 0

	local function heapPush(node: string, d: number)
		heapSize += 1
		heap[heapSize] = { node, d }
		local i = heapSize
		while i > 1 do
			local parent = math.floor(i / 2)
			if (heap[parent][2] :: number) <= d then break end
			heap[i], heap[parent] = heap[parent], heap[i]
			i = parent
		end
	end

	local function heapPop(): (string?, number?)
		if heapSize == 0 then return nil, nil end
		local root = heap[1]
		heap[1] = heap[heapSize]
		heap[heapSize] = nil
		heapSize -= 1
		local i = 1
		while true do
			local left = i * 2
			local right = left + 1
			local smallest = i
			if left <= heapSize and (heap[left][2] :: number) < (heap[smallest][2] :: number) then
				smallest = left
			end
			if right <= heapSize and (heap[right][2] :: number) < (heap[smallest][2] :: number) then
				smallest = right
			end
			if smallest == i then break end
			heap[i], heap[smallest] = heap[smallest], heap[i]
			i = smallest
		end
		return root[1] :: string, root[2] :: number
	end

	dist[startNode] = 0
	heapPush(startNode, 0)

	while heapSize > 0 do
		local node, d = heapPop()
		if not node or (d :: number) > (dist[node] or math.huge) then
			continue
		end
		for _, e in ipairs(edges) do
			if e[1] == node then
				local neighbor = e[2] :: string
				local weight = weights[node .. "->" .. neighbor] or 1
				local newDist = (d :: number) + weight
				if newDist < (dist[neighbor] or math.huge) then
					dist[neighbor] = newDist
					heapPush(neighbor, newDist)
				end
			end
		end
	end
	return dist
end

function MathUtils.minimumSpanningTree(nodes: { string }, edges: { { string | number } }): { { string | number } }
	local sorted: { { string | number } } = {}
	for _, e in ipairs(edges) do
		table.insert(sorted, { e[1] :: string, e[2] :: string, e[3] :: number })
	end
	table.sort(sorted, function(a, b) return (a[3] :: number) < (b[3] :: number) end)
	local parent: { [string]: string } = {}
	local function find(u: string): string
		if parent[u] == nil then parent[u] = u end
		if parent[u] ~= u then parent[u] = find(parent[u]) end
		return parent[u]
	end
	local function union(u: string, v: string)
		parent[find(u)] = find(v)
	end
	local mst: { { string | number } } = {}
	for _, e in ipairs(sorted) do
		local u, v = e[1] :: string, e[2] :: string
		if find(u) ~= find(v) then
			union(u, v)
			table.insert(mst, e)
		end
	end
	return mst
end

function MathUtils.createHeap(initial: { number }?, comparator: ((number, number) -> boolean)?): { any }
	local heap: { number } = {}
	local cmp = comparator or function(a: number, b: number): boolean return a < b end
	if initial then
		for _, v in ipairs(initial) do
			table.insert(heap, v)
		end
		for i = math.floor(#heap / 2), 1, -1 do
			local idx = i
			while true do
				local left = idx * 2
				local right = left + 1
				local smallest = idx
				if left <= #heap and cmp(heap[left], heap[smallest]) then smallest = left end
				if right <= #heap and cmp(heap[right], heap[smallest]) then smallest = right end
				if smallest == idx then break end
				heap[idx], heap[smallest] = heap[smallest], heap[idx]
				idx = smallest
			end
		end
	end
	local push = function(value: number)
		table.insert(heap, value)
		local idx = #heap
		while idx > 1 do
			local p = math.floor(idx / 2)
			if cmp(heap[p], heap[idx]) then break end
			heap[p], heap[idx] = heap[idx], heap[p]
			idx = p
		end
	end
	local peek = function(): number?
		return heap[1]
	end
	local pop = function(): number
		local result = heap[1]
		heap[1] = heap[#heap]
		table.remove(heap)
		local idx = 1
		while true do
			local left = idx * 2
			local right = left + 1
			local smallest = idx
			if left <= #heap and cmp(heap[left], heap[smallest]) then smallest = left end
			if right <= #heap and cmp(heap[right], heap[smallest]) then smallest = right end
			if smallest == idx then break end
			heap[idx], heap[smallest] = heap[smallest], heap[idx]
			idx = smallest
		end
		return result
	end
	return { heap, push, peek, pop }
end

function MathUtils.shuntingYard(tokens: { string }, precedence: { [string]: number }, rightAssociative: { [string]: boolean }?): { string }
	local output: { string } = {}
	local operators: { string } = {}
	local rightAssoc = rightAssociative or {}
	for _, token in ipairs(tokens) do
		if precedence[token] then
			while #operators > 0 do
				local top = operators[#operators]
				if not precedence[top] then break end
				local pTop = precedence[top]
				local pToken = precedence[token]
				if (not rightAssoc[token] and pToken <= pTop) or (rightAssoc[token] and pToken < pTop) then
					table.insert(output, table.remove(operators) :: string)
				else
					break
				end
			end
			table.insert(operators, token)
		elseif token == "(" then
			table.insert(operators, token)
		elseif token == ")" then
			while #operators > 0 and operators[#operators] ~= "(" do
				table.insert(output, table.remove(operators) :: string)
			end
			if #operators > 0 then table.remove(operators) end
		else
			table.insert(output, token)
		end
	end
	while #operators > 0 do
		table.insert(output, table.remove(operators) :: string)
	end
	return output
end

function MathUtils.evaluatePostfix(tokens: { string }, variables: { [string]: number }?): number
	local stack: { number } = {}
	local vars: { [string]: number } = variables or {}
	for _, token in ipairs(tokens) do
		if token == "+" then
			local b = table.remove(stack) or 0
			local a = table.remove(stack) or 0
			table.insert(stack, a + b)
		elseif token == "-" then
			local b = table.remove(stack) or 0
			local a = table.remove(stack) or 0
			table.insert(stack, a - b)
		elseif token == "*" then
			local b = table.remove(stack) or 0
			local a = table.remove(stack) or 0
			table.insert(stack, a * b)
		elseif token == "/" then
			local b = table.remove(stack) or 0
			local a = table.remove(stack) or 0
			table.insert(stack, if b ~= 0 then a / b else 0)
		elseif token == "^" then
			local b = table.remove(stack) or 0
			local a = table.remove(stack) or 0
			table.insert(stack, a ^ b)
		elseif token == "%" then
			local b = table.remove(stack) or 0
			local a = table.remove(stack) or 0
			table.insert(stack, if b ~= 0 then a % b else 0)
		else
			local num = tonumber(token)
			if num ~= nil then
				table.insert(stack, num)
			else
				table.insert(stack, vars[token] or 0)
			end
		end
	end
	return stack[1] or 0
end

type TrieNode = { children: { [string]: TrieNode }, isEnd: boolean }

function MathUtils.createTrie(): TrieNode
	return { children = {}, isEnd = false }
end

function MathUtils.trieInsert(root: TrieNode, word: string)
	local node = root
	for i = 1, #word do
		local ch = string.sub(word, i, i)
		if not node.children[ch] then
			node.children[ch] = { children = {}, isEnd = false }
		end
		node = node.children[ch]
	end
	node.isEnd = true
end

function MathUtils.trieSearch(root: TrieNode, word: string): boolean
	local node = root
	for i = 1, #word do
		local ch = string.sub(word, i, i)
		if not node.children[ch] then return false end
		node = node.children[ch]
	end
	return node.isEnd
end

function MathUtils.trieStartsWith(root: TrieNode, prefix: string): boolean
	local node = root
	for i = 1, #prefix do
		local ch = string.sub(prefix, i, i)
		if not node.children[ch] then return false end
		node = node.children[ch]
	end
	return true
end

function MathUtils.trieCollect(node: TrieNode, prefix: string): { string }
	local results: { string } = {}
	if node.isEnd then table.insert(results, prefix) end
	for ch, child in pairs(node.children) do
		local childResults = MathUtils.trieCollect(child, prefix .. ch)
		for _, r in ipairs(childResults) do
			table.insert(results, r)
		end
	end
	return results
end

function MathUtils.trieAutocomplete(root: TrieNode, prefix: string): { string }
	local node = root
	for i = 1, #prefix do
		local ch = string.sub(prefix, i, i)
		if not node.children[ch] then return {} end
		node = node.children[ch]
	end
	return MathUtils.trieCollect(node, prefix)
end

type LRUNode = { key: string, value: any, prev: LRUNode?, next: LRUNode? }
type LRUCache = { capacity: number, size: number, head: LRUNode, tail: LRUNode, map: { [string]: LRUNode } }

function MathUtils.createLRUCache(capacity: number): LRUCache
	local head: LRUNode = { key = "", value = nil, prev = nil, next = nil }
	local tail: LRUNode = { key = "", value = nil, prev = head, next = nil }
	head.next = tail
	return { capacity = capacity, size = 0, head = head, tail = tail, map = {} }
end

function MathUtils.lruGet(cache: LRUCache, key: string): any
	local node = cache.map[key]
	if not node then return nil end
	local prevNode = node.prev
	if prevNode then
		prevNode.next = node.next
	end
	if node.next then node.next.prev = node.prev end
	node.prev = cache.head
	node.next = cache.head.next
	local headNext = cache.head.next
	if headNext then
		headNext.prev = node
	end
	cache.head.next = node
	return node.value
end

function MathUtils.lruPut(cache: LRUCache, key: string, value: any)
	local existing = cache.map[key]
	if existing then
		existing.value = value
		MathUtils.lruGet(cache, key)
		return
	end
	local newNode: LRUNode = { key = key, value = value, prev = cache.head, next = cache.head.next }
	local headNext = cache.head.next
	if headNext then
		headNext.prev = newNode
	end
	cache.head.next = newNode
	cache.map[key] = newNode
	cache.size += 1
	if cache.size > cache.capacity then
		local lru = cache.tail.prev
		if lru then
			local lruPrev = lru.prev
			if lruPrev then
				lruPrev.next = cache.tail
			end
			if lru.prev then
				cache.tail.prev = lru.prev
			end
			cache.map[lru.key] = nil
			cache.size -= 1
		end
	end
end

type BloomFilter = { bits: { boolean }, size: number, hashCount: number }

function MathUtils.createBloomFilter(size: number, hashCount: number): BloomFilter
	local bits: { boolean } = {}
	for _ = 1, size do table.insert(bits, false) end
	return { bits = bits, size = size, hashCount = hashCount }
end

function MathUtils.bloomAdd(filter: BloomFilter, item: string)
	for i = 1, filter.hashCount do
		local hash = MathUtils.fnv1aHash32(item .. tostring(i))
		local idx = (hash % filter.size) + 1
		filter.bits[idx] = true
	end
end

function MathUtils.bloomMaybeContains(filter: BloomFilter, item: string): boolean
	for i = 1, filter.hashCount do
		local hash = MathUtils.fnv1aHash32(item .. tostring(i))
		local idx = (hash % filter.size) + 1
		if not filter.bits[idx] then return false end
	end
	return true
end

function MathUtils.levenshteinDistance(a: string, b: string): number
	local m, n = #a, #b
	if m == 0 then return n end
	if n == 0 then return m end
	local previous: { number } = {}
	for j = 0, n do previous[j + 1] = j end
	for i = 1, m do
		local current: { number } = { i }
		local ai = string.byte(a, i)
		for j = 1, n do
			local cost = if ai == string.byte(b, j) then 0 else 1
			current[j + 1] = math.min(math.min(previous[j + 1] + 1, current[j] + 1), previous[j] + cost)
		end
		previous = current
	end
	return previous[n + 1]
end

function MathUtils.hammingDistance(a: string, b: string): number?
	if #a ~= #b then return nil end
	local dist = 0
	for i = 1, #a do
		if string.byte(a, i) ~= string.byte(b, i) then dist += 1 end
	end
	return dist
end

function MathUtils.longestCommonSubsequence(a: string, b: string): string
	local m, n = #a, #b
	local dp: { { number } } = {}
	for i = 0, m do
		dp[i] = {}
		for j = 0, n do dp[i][j] = 0 end
	end
	for i = 1, m do
		for j = 1, n do
			if string.byte(a, i) == string.byte(b, j) then
				dp[i][j] = dp[i - 1][j - 1] + 1
			else
				dp[i][j] = math.max(dp[i - 1][j], dp[i][j - 1])
			end
		end
	end
	local result = ""
	local i, j = m, n
	while i > 0 and j > 0 do
		if string.byte(a, i) == string.byte(b, j) then
			result = string.sub(a, i, i) .. result
			i -= 1
			j -= 1
		elseif dp[i - 1][j] > dp[i][j - 1] then
			i -= 1
		else
			j -= 1
		end
	end
	return result
end

function MathUtils.knuthMorrisPrattPatternSearch(text: string, pattern: string): { number }
	if #pattern == 0 then return {} end
	local lps: { number } = {}
	local len = 0
	local i = 2
	while i <= #pattern do
		if string.byte(pattern, i) == string.byte(pattern, len + 1) then
			len += 1
			lps[i] = len
			i += 1
		elseif len ~= 0 then
			len = lps[len]
		else
			lps[i] = 0
			i += 1
		end
	end
	local result: { number } = {}
	local j = 1
	len = 0
	while j <= #text do
		if string.byte(text, j) == string.byte(pattern, len + 1) then
			len += 1
			j += 1
			if len == #pattern then
				table.insert(result, j - len)
				len = lps[len]
			end
		elseif len ~= 0 then
			len = lps[len]
		else
			j += 1
		end
	end
	return result
end

function MathUtils.numberToBase(value: number, base: number): string
	if base < 2 or base > 36 then error("base must be between 2 and 36") end
	local digits = "0123456789abcdefghijklmnopqrstuvwxyz"
	if value == 0 then return "0" end
	local negative = value < 0
	value = math.abs(value)
	local result = ""
	while value > 0 do
		local rem = value % base
		result = string.sub(digits, rem + 1, rem + 1) .. result
		value = math.floor(value / base)
	end
	return if negative then "-" .. result else result
end

function MathUtils.baseToNumber(str: string, base: number): number
	if base < 2 or base > 36 then error("base must be between 2 and 36") end
	local digits = "0123456789abcdefghijklmnopqrstuvwxyz"
	local map: { [string]: number } = {}
	for i = 1, #digits do map[string.sub(digits, i, i)] = i - 1 end
	local negative = string.sub(str, 1, 1) == "-"
	local startIdx = if negative then 2 else 1
	local result = 0
	for i = startIdx, #str do
		local ch = string.sub(str, i, i)
		local val = map[ch]
		if val == nil then error("invalid digit: " .. ch) end
		result = result * base + val
	end
	return if negative then -result else result
end

function MathUtils.formatWithCommas(n: number): string
	local formatted = tostring(math.floor(math.abs(n)))
	local k = 1
	while k < #formatted do
		formatted = string.sub(formatted, 1, #formatted - k * 3) .. "," .. string.sub(formatted, #formatted - k * 3 + 1)
		k += 1
	end
	if n < 0 then formatted = "-" .. formatted end
	return formatted
end

function MathUtils.formatBytes(bytes: number): string
	local units = { "B", "KB", "MB", "GB", "TB" }
	local unitIndex = 1
	local value = bytes
	while value >= 1024 and unitIndex < #units do
		value = value / 1024
		unitIndex += 1
	end
	return string.format("%.2f %s", value, units[unitIndex])
end

function MathUtils.formatDuration(seconds: number): string
	local hours = math.floor(seconds / 3600)
	local minutes = math.floor((seconds % 3600) / 60)
	local secs = math.floor(seconds % 60)
	if hours > 0 then
		return string.format("%02d:%02d:%02d", hours, minutes, secs)
	end
	return string.format("%02d:%02d", minutes, secs)
end

function MathUtils.quickSort(arr: { number }, compare: ((number, number) -> boolean)?): { number }
	local cmp = compare or function(a: number, b: number): boolean return a < b end
	local function partition(low: number, high: number): number
		local pivot = arr[high]
		local i = low - 1
		for j = low, high - 1 do
			if cmp(arr[j], pivot) then
				i += 1
				arr[i], arr[j] = arr[j], arr[i]
			end
		end
		arr[i + 1], arr[high] = arr[high], arr[i + 1]
		return i + 1
	end
	local function sort(low: number, high: number)
		if low < high then
			local pi = partition(low, high)
			sort(low, pi - 1)
			sort(pi + 1, high)
		end
	end
	sort(1, #arr)
	return arr
end

function MathUtils.mergeSort(arr: { number }, compare: ((number, number) -> boolean)?): { number }
	local cmp = compare or function(a: number, b: number): boolean return a < b end
	local function merge(left: { number }, right: { number }): { number }
		local result: { number } = {}
		local i, j = 1, 1
		while i <= #left and j <= #right do
			if cmp(left[i], right[j]) then
				table.insert(result, left[i])
				i += 1
			else
				table.insert(result, right[j])
				j += 1
			end
		end
		while i <= #left do
			table.insert(result, left[i])
			i += 1
		end
		while j <= #right do
			table.insert(result, right[j])
			j += 1
		end
		return result
	end
	local function sort(sub: { number }): { number }
		local n = #sub
		if n <= 1 then
			return sub
		end
		local mid = math.floor(n / 2)
		local left: { number } = {}
		local right: { number } = {}
		for i = 1, mid do
			table.insert(left, sub[i])
		end
		for i = mid + 1, n do
			table.insert(right, sub[i])
		end
		return merge(sort(left), sort(right))
	end
	return sort(arr)
end

function MathUtils.heapSort(arr: { number }, compare: ((number, number) -> boolean)?): { number }
	local cmp = compare or function(a: number, b: number): boolean return a < b end
	local n = #arr
	local function siftDown(startIdx: number, endIdx: number)
		local root = startIdx
		while true do
			local child = root * 2
			if child > endIdx then
				break
			end
			if child + 1 <= endIdx and cmp(arr[child + 1], arr[child]) then
				child += 1
			end
			if cmp(arr[root], arr[child]) then
				break
			end
			arr[root], arr[child] = arr[child], arr[root]
			root = child
		end
	end
	for i = math.floor(n / 2), 1, -1 do
		siftDown(i, n)
	end
	for i = n, 2, -1 do
		arr[1], arr[i] = arr[i], arr[1]
		siftDown(1, i - 1)
	end
	return arr
end

function MathUtils.binarySearch(arr: { number }, target: number): number?
	local low, high = 1, #arr
	while low <= high do
		local mid = math.floor((low + high) / 2)
		if arr[mid] == target then
			return mid
		elseif arr[mid] < target then
			low = mid + 1
		else
			high = mid - 1
		end
	end
	return nil
end

function MathUtils.interpolationSearch(arr: { number }, target: number): number?
	local low, high = 1, #arr
	while low <= high and arr[low] <= target and target <= arr[high] do
		if low == high then
			if arr[low] == target then
				return low
			end
			return nil
		end
		local pos = low + math.floor(((target - arr[low]) / (arr[high] - arr[low])) * (high - low))
		if arr[pos] == target then
			return pos
		end
		if arr[pos] < target then
			low = pos + 1
		else
			high = pos - 1
		end
	end
	return nil
end

function MathUtils.linearRegression(x: { number }, y: { number }): (number, number, number)
	local n = #x
	if n ~= #y or n < 2 then
		return 0, 0, 0
	end
	local sumX, sumY, sumXY, sumX2 = 0, 0, 0, 0
	for i = 1, n do
		sumX += x[i]
		sumY += y[i]
		sumXY += x[i] * y[i]
		sumX2 += x[i] * x[i]
	end
	local denom = n * sumX2 - sumX * sumX
	if math.abs(denom) < 1e-10 then
		return 0, sumY / n, 0
	end
	local slope = (n * sumXY - sumX * sumY) / denom
	local intercept = (sumY - slope * sumX) / n
	local rNumerator = n * sumXY - sumX * sumY
	local rDenominator = math.sqrt((n * sumX2 - sumX * sumX) * (n * sumY * sumY - sumY * sumY))
	local r = if rDenominator > 1e-10 then rNumerator / rDenominator else 0
	return slope, intercept, r
end

function MathUtils.mean(values: { number }): number
	local sum = 0
	for _, v in ipairs(values) do
		sum += v
	end
	return sum / #values
end

function MathUtils.median(values: { number }): number
	local sorted = {}
	for _, v in ipairs(values) do
		table.insert(sorted, v)
	end
	table.sort(sorted)
	local n = #sorted
	if n % 2 == 1 then
		return sorted[math.floor(n / 2) + 1]
	end
	return (sorted[n / 2] + sorted[n / 2 + 1]) / 2
end

function MathUtils.variance(values: { number }): number
	local m = MathUtils.mean(values)
	local sumSq = 0
	for _, v in ipairs(values) do
		local diff = v - m
		sumSq += diff * diff
	end
	return sumSq / #values
end

function MathUtils.standardDeviation(values: { number }): number
	return math.sqrt(MathUtils.variance(values))
end

function MathUtils.quadraticBezier2D(p0: Vector2, p1: Vector2, p2: Vector2, t: number): Vector2
	local oneMinusT = 1 - t
	return p0 * oneMinusT * oneMinusT + p1 * 2 * oneMinusT * t + p2 * t * t
end

function MathUtils.cubicBezier2D(p0: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, t: number): Vector2
	local oneMinusT = 1 - t
	local oneMinusT2 = oneMinusT * oneMinusT
	local t2 = t * t
	return p0 * oneMinusT2 * oneMinusT + p1 * 3 * oneMinusT2 * t + p2 * 3 * oneMinusT * t2 + p3 * t2 * t
end

function MathUtils.cubicBezierLengthApprox(p0: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, segments: number?): number
	local n = segments or 20
	local length = 0
	local prev = p0
	for i = 1, n do
		local t = i / n
		local pt = MathUtils.cubicBezier2D(p0, p1, p2, p3, t)
		length += (pt - prev).Magnitude
		prev = pt
	end
	return length
end

function MathUtils.catmullRom2D(p0: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, t: number): Vector2
	local t2 = t * t
	local t3 = t2 * t
	return p1 * (2 * t3 - 3 * t2 + 1) + p2 * (-2 * t3 + 3 * t2) + p0 * (t3 - 2 * t2 + t) + p3 * (t3 - t2)
end

function MathUtils.splineSample(points: { Vector2 }, t: number): Vector2
	local n = #points
	if n == 0 then
		return Vector2.zero
	end
	if n == 1 then
		return points[1]
	end
	local idx = math.clamp(math.floor(t * (n - 1)) + 1, 1, n - 1)
	local localT = (t * (n - 1)) - (idx - 1)
	local p1 = points[idx]
	local p2 = points[idx + 1]
	return p1 + (p2 - p1) * localT
end

function MathUtils.rgbToHsl(r: number, g: number, b: number): (number, number, number)
	local maxVal = math.max(r, g, b)
	local minVal = math.min(r, g, b)
	local h, s, l = 0, 0, (maxVal + minVal) / 2
	local d = maxVal - minVal
	if d ~= 0 then
		s = if l > 0.5 then d / (2 - maxVal - minVal) else d / (maxVal + minVal)
		if maxVal == r then
			h = ((g - b) / d + (if g < b then 6 else 0)) / 6
		elseif maxVal == g then
			h = ((b - r) / d + 2) / 6
		else
			h = ((r - g) / d + 4) / 6
		end
	end
	return h, s, l
end

function MathUtils.hslToRgb(h: number, s: number, l: number): (number, number, number)
	if s == 0 then
		return l, l, l
	end
	local function hue2rgb(p: number, q: number, t: number): number
		if t < 0 then t += 1 end
		if t > 1 then t -= 1 end
		if t < 1 / 6 then return p + (q - p) * 6 * t end
		if t < 1 / 2 then return q end
		if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
		return p
	end
	local q = if l < 0.5 then l * (1 + s) else l + s - l * s
	local p = 2 * l - q
	return hue2rgb(p, q, h + 1 / 3), hue2rgb(p, q, h), hue2rgb(p, q, h - 1 / 3)
end

function MathUtils.rgbToHsv(r: number, g: number, b: number): (number, number, number)
	local maxVal = math.max(r, g, b)
	local minVal = math.min(r, g, b)
	local d = maxVal - minVal
	local s = if maxVal == 0 then 0 else d / maxVal
	local h = 0
	if d ~= 0 then
		if maxVal == r then
			h = ((g - b) / d + (if g < b then 6 else 0)) / 6
		elseif maxVal == g then
			h = ((b - r) / d + 2) / 6
		else
			h = ((r - g) / d + 4) / 6
		end
	end
	return h, s, maxVal
end

function MathUtils.hsvToRgb(h: number, s: number, v: number): (number, number, number)
	local i = math.floor(h * 6)
	local f = h * 6 - i
	local p = v * (1 - s)
	local q = v * (1 - f * s)
	local t = v * (1 - (1 - f) * s)
	i = i % 6
	if i == 0 then return v, t, p
	elseif i == 1 then return q, v, p
	elseif i == 2 then return p, v, t
	elseif i == 3 then return p, q, v
	elseif i == 4 then return t, p, v
	else return v, p, q end
end

function MathUtils.lerpColor(a: Color3, b: Color3, t: number): Color3
	return a:Lerp(b, t)
end

function MathUtils.colorDistance(a: Color3, b: Color3): number
	local dr = a.R - b.R
	local dg = a.G - b.G
	local db = a.B - b.B
	return math.sqrt(dr * dr + dg * dg + db * db)
end

function MathUtils.perceivedBrightness(c: Color3): number
	return math.sqrt(c.R * c.R * 0.241 + c.G * c.G * 0.691 + c.B * c.B * 0.068)
end

function MathUtils.isDarkColor(c: Color3): boolean
	return MathUtils.perceivedBrightness(c) < 0.5
end

function MathUtils.complementaryColor(c: Color3): Color3
	local h, s, l = MathUtils.rgbToHsl(c.R, c.G, c.B)
	h = (h + 0.5) % 1
	local r, g, b = MathUtils.hslToRgb(h, s, l)
	return Color3.new(r, g, b)
end

function MathUtils.wrapText(text: string, maxWidth: number, measureWidth: ((string) -> number)): { string }
	local lines: { string } = {}
	local currentLine = ""
	for word in string.gmatch(text, "%S+") do
		local testLine = if currentLine == "" then word else currentLine .. " " .. word
		if measureWidth(testLine) > maxWidth and currentLine ~= "" then
			table.insert(lines, currentLine)
			currentLine = word
		else
			currentLine = testLine
		end
	end
	if currentLine ~= "" then
		table.insert(lines, currentLine)
	end
	return lines
end

function MathUtils.expandTabs(text: string, tabSize: number?): string
	local size = tabSize or 4
	local result = ""
	local col = 1
	for i = 1, #text do
		local ch = string.sub(text, i, i)
		if ch == "\t" then
			local spaces = size - ((col - 1) % size)
			result ..= string.rep(" ", spaces)
			col += spaces
		else
			result ..= ch
			col += 1
		end
	end
	return result
end

function MathUtils.lineColumnToOffset(text: string, line: number, column: number): number
	local currentLine = 1
	local offset = 1
	for i = 1, #text do
		if currentLine == line then
			return offset + column - 1
		end
		if string.sub(text, i, i) == "\n" then
			currentLine += 1
			offset = i + 1
		end
	end
	return offset + column - 1
end

function MathUtils.offsetToLineColumn(text: string, offset: number): (number, number)
	local line = 1
	local col = 1
	for i = 1, math.min(offset - 1, #text) do
		if string.sub(text, i, i) == "\n" then
			line += 1
			col = 1
		else
			col += 1
		end
	end
	return line, col
end

function MathUtils.countLeadingWhitespace(line: string): number
	local spaces = 0
	for i = 1, #line do
		local ch = string.sub(line, i, i)
		if ch == " " or ch == "\t" then
			spaces += 1
		else
			break
		end
	end
	return spaces
end

function MathUtils.linesToOffsets(text: string): { number }
	local offsets: { number } = { 1 }
	for i = 1, #text do
		if string.sub(text, i, i) == "\n" then
			table.insert(offsets, i + 1)
		end
	end
	return offsets
end

function MathUtils.createQuadtree(bounds: { minX: number, minY: number, maxX: number, maxY: number }, capacity: number?, maxDepth: number?)
	local cap = capacity or 4
	local depth = maxDepth or 10
	return {
		bounds = bounds,
		capacity = cap,
		maxDepth = depth,
		points = {},
		divided = false,
		nw = nil,
		ne = nil,
		sw = nil,
		se = nil
	}
end

function MathUtils.quadtreeInsert(tree: any, point: { x: number, y: number, data: any? }, depth: number?)
	local d = depth or 0
	if point.x < tree.bounds.minX or point.x > tree.bounds.maxX or point.y < tree.bounds.minY or point.y > tree.bounds.maxY then
		return false
	end
	if not tree.divided then
		if #tree.points < tree.capacity or d >= tree.maxDepth then
			table.insert(tree.points, point)
			return true
		end
		MathUtils.quadtreeSubdivide(tree)
	end
	return MathUtils.quadtreeInsert(tree.nw, point, d + 1) or
		MathUtils.quadtreeInsert(tree.ne, point, d + 1) or
		MathUtils.quadtreeInsert(tree.sw, point, d + 1) or
		MathUtils.quadtreeInsert(tree.se, point, d + 1)
end

function MathUtils.quadtreeSubdivide(tree: any)
	local midX = (tree.bounds.minX + tree.bounds.maxX) / 2
	local midY = (tree.bounds.minY + tree.bounds.maxY) / 2
	local function makeTree(minX: number, minY: number, maxX: number, maxY: number)
		return {
			bounds = { minX = minX, minY = minY, maxX = maxX, maxY = maxY },
			capacity = tree.capacity,
			maxDepth = tree.maxDepth,
			points = {},
			divided = false,
			nw = nil, ne = nil, sw = nil, se = nil
		}
	end
	tree.nw = makeTree(tree.bounds.minX, tree.bounds.minY, midX, midY)
	tree.ne = makeTree(midX, tree.bounds.minY, tree.bounds.maxX, midY)
	tree.sw = makeTree(tree.bounds.minX, midY, midX, tree.bounds.maxY)
	tree.se = makeTree(midX, midY, tree.bounds.maxX, tree.bounds.maxY)
	tree.divided = true
	for _, p in ipairs(tree.points) do
		MathUtils.quadtreeInsert(tree.nw, p, 1)
		MathUtils.quadtreeInsert(tree.ne, p, 1)
		MathUtils.quadtreeInsert(tree.sw, p, 1)
		MathUtils.quadtreeInsert(tree.se, p, 1)
	end
	tree.points = {}
end

function MathUtils.quadtreeQuery(tree: any, range: { minX: number, minY: number, maxX: number, maxY: number }): { any }
	local found: { any } = {}
	if range.maxX < tree.bounds.minX or range.minX > tree.bounds.maxX or range.maxY < tree.bounds.minY or range.minY > tree.bounds.maxY then
		return found
	end
	if not tree.divided then
		for _, p in ipairs(tree.points) do
			if p.x >= range.minX and p.x <= range.maxX and p.y >= range.minY and p.y <= range.maxY then
				table.insert(found, p)
			end
		end
		return found
	end
	for _, sub in ipairs({ tree.nw, tree.ne, tree.sw, tree.se }) do
		local subFound = MathUtils.quadtreeQuery(sub, range)
		for _, p in ipairs(subFound) do
			table.insert(found, p)
		end
	end
	return found
end

function MathUtils.boxPacking2D(boxes: { { w: number, h: number } }, containerWidth: number): { { x: number, y: number, w: number, h: number } }
	local sorted: { { w: number, h: number } } = {}
	for _, b in ipairs(boxes) do
		table.insert(sorted, b)
	end
	table.sort(sorted, function(a: { w: number, h: number }, b: { w: number, h: number }) return a.h > b.h end)
	local shelves: { { y: number, height: number, remaining: number, boxes: { { x: number, y: number, w: number, h: number } } } } = {}
	for _, b in ipairs(sorted) do
		local placed = false
		for _, shelf in ipairs(shelves) do
			if b.w <= shelf.remaining and b.h <= shelf.height then
				table.insert(shelf.boxes, { x = containerWidth - shelf.remaining, y = shelf.y, w = b.w, h = b.h })
				shelf.remaining -= b.w
				placed = true
				break
			end
		end
		if not placed then
			local y = 0
			for _, shelf in ipairs(shelves) do
				y = math.max(y, shelf.y + shelf.height)
			end
			local newShelf = { y = y, height = b.h, remaining = containerWidth - b.w, boxes = { { x = 0, y = y, w = b.w, h = b.h } } }
			table.insert(shelves, newShelf)
		end
	end
	local result: { { x: number, y: number, w: number, h: number } } = {}
	for _, shelf in ipairs(shelves) do
		for _, b in ipairs(shelf.boxes) do
			table.insert(result, b)
		end
	end
	return result
end

function MathUtils.spatialHash2D(points: { Vector2 }, cellSize: number): { [string]: { Vector2 } }
	local grid: { [string]: { Vector2 } } = {}
	for _, p in ipairs(points) do
		local cellX = math.floor(p.X / cellSize)
		local cellY = math.floor(p.Y / cellSize)
		local key = cellX .. "," .. cellY
		if not grid[key] then
			grid[key] = {}
		end
		table.insert(grid[key], p)
	end
	return grid
end

function MathUtils.kNearestNeighbors2D(points: { Vector2 }, query: Vector2, k: number): { { point: Vector2, distSq: number } }
	if k <= 0 then return {} end
	local heap: { { point: Vector2, distSq: number } } = {}
	local size = 0
	local function push(v)
		size += 1; heap[size] = v; local i = size
		while i > 1 do
			local p = math.floor(i / 2)
			if heap[p].distSq >= v.distSq then break end
			heap[i], heap[p] = heap[p], heap[i]
			i = p
		end
	end
	local function pop(): { point: Vector2, distSq: number }
		local r = heap[1]
		heap[1] = heap[size]
		heap[size] = nil
		size -= 1
		local i = 1
		while true do
			local l = i * 2
			local ri = l + 1
			local big = i
			if l <= size and heap[l].distSq > heap[big].distSq then big = l end
			if ri <= size and heap[ri].distSq > heap[big].distSq then big = ri end
			if big == i then break end
			heap[i], heap[big] = heap[big], heap[i]
			i = big
		end
		return r
	end
	for _, p in ipairs(points) do
		local dx = p.X - query.X
		local dy = p.Y - query.Y
		local d = dx * dx + dy * dy
		if size < k then
			push({ point = p, distSq = d })
		elseif d < heap[1].distSq then
			pop(); push({ point = p, distSq = d })
		end
	end
	local result: { { point: Vector2, distSq: number } } = {}
	while size > 0 do table.insert(result, pop()) end
	for i = 1, math.floor(#result / 2) do
		result[i], result[#result - i + 1] = result[#result - i + 1], result[i]
	end
	return result
end

function MathUtils.convexHull2D(points: { Vector2 }): { Vector2 }
	if #points <= 1 then
		return points
	end
	local sorted: { Vector2 } = {}
	for _, p in ipairs(points) do
		table.insert(sorted, p)
	end
	table.sort(sorted, function(a: Vector2, b: Vector2)
		if a.X ~= b.X then
			return a.X < b.X
		end
		return a.Y < b.Y
	end)
	local function cross(o: Vector2, a: Vector2, b: Vector2): number
		return (a.X - o.X) * (b.Y - o.Y) - (a.Y - o.Y) * (b.X - o.X)
	end
	local lower: { Vector2 } = {}
	for i = 1, #sorted do
		while #lower >= 2 and cross(lower[#lower - 1], lower[#lower], sorted[i]) <= 0 do
			table.remove(lower)
		end
		table.insert(lower, sorted[i])
	end
	local upper: { Vector2 } = {}
	for i = #sorted, 1, -1 do
		while #upper >= 2 and cross(upper[#upper - 1], upper[#upper], sorted[i]) <= 0 do
			table.remove(upper)
		end
		table.insert(upper, sorted[i])
	end
	table.remove(lower)
	table.remove(upper)
	local result: { Vector2 } = {}
	for _, p in ipairs(lower) do
		table.insert(result, p)
	end
	for _, p in ipairs(upper) do
		table.insert(result, p)
	end
	return result
end

function MathUtils.delaunayTriangulation2D(points: { Vector2 }): { { Vector2 } }
	if #points < 3 then
		return {}
	end
	local triangles: { { Vector2 } } = {}
	local n = #points
	for i = 1, n - 2 do
		for j = i + 1, n - 1 do
			for k = j + 1, n do
				local a, b, c = points[i], points[j], points[k]
				local valid = true
				for m = 1, n do
					if m ~= i and m ~= j and m ~= k then
						local p = points[m]
						local ax, ay = a.X - p.X, a.Y - p.Y
						local bx, by = b.X - p.X, b.Y - p.Y
						local cx, cy = c.X - p.X, c.Y - p.Y
						local dA = ax * ax + ay * ay
						local dB = bx * bx + by * by
						local dC = cx * cx + cy * cy
						local det = ax * (by - cy) - ay * (bx - cx) + dA * (bx * cy - by * cx)
							- dB * (ax * cy - ay * cx) + dC * (ax * by - ay * bx)
						if det > 0 then
							valid = false
							break
						end
					end
				end
				if valid then
					table.insert(triangles, { a, b, c })
				end
			end
		end
	end
	return triangles
end

function MathUtils.seededRandom(seed: number): () -> number
	local s = seed % 2147483647
	if s == 0 then
		s = 1
	end
	return function()
		s = (s * 48271) % 2147483647
		return s / 2147483647
	end
end

function MathUtils.seededRandomRange(seed: number, minVal: number, maxVal: number): () -> number
	local gen = MathUtils.seededRandom(seed)
	return function()
		return minVal + gen() * (maxVal - minVal)
	end
end

function MathUtils.shuffleArray(arr: { any }, seed: number?): { any }
	local rng = MathUtils.seededRandom(seed or math.random(1, 2147483646))
	local result = {}
	for _, v in ipairs(arr) do
		table.insert(result, v)
	end
	for i = #result, 2, -1 do
		local j = math.floor(rng() * i) + 1
		result[i], result[j] = result[j], result[i]
	end
	return result
end

function MathUtils.sampleWithoutReplacement(population: { any }, k: number, seed: number?): { any }
	if k > #population then
		return {}
	end
	local shuffled = MathUtils.shuffleArray(population, seed)
	local result: { any } = {}
	for i = 1, k do
		table.insert(result, shuffled[i])
	end
	return result
end

function MathUtils.breadthFirstSearch(startNode: string, edges: { { string } }, maxDepth: number?): { [string]: number }
	local depth: { [string]: number } = {}
	local queue: { string } = {}
	depth[startNode] = 0
	table.insert(queue, startNode)
	local front = 1
	local limit = maxDepth or math.huge
	while front <= #queue do
		local u = queue[front]
		front += 1
		local d = depth[u]
		if d < limit then
			for _, e in ipairs(edges) do
				if e[1] == u then
					local v = e[2] :: string
					if depth[v] == nil then
						depth[v] = d + 1
						table.insert(queue, v)
					end
				end
			end
		end
	end
	return depth
end

function MathUtils.depthFirstSearch(startNode: string, edges: { { string } }): { string }
	local visited: { [string]: boolean } = {}
	local order: { string } = {}
	local adj: { [string]: { string } } = {}
	for _, e in ipairs(edges) do
		local u = e[1] :: string
		local v = e[2] :: string
		if not adj[u] then
			adj[u] = {}
		end
		table.insert(adj[u], v)
	end
	local function dfs(u: string)
		visited[u] = true
		table.insert(order, u)
		for _, v in ipairs(adj[u] or {}) do
			if not visited[v] then
				dfs(v)
			end
		end
	end
	dfs(startNode)
	return order
end

function MathUtils.createDFA(): { states: { [string]: { [string]: string } }, start: string?, accepts: { [string]: boolean } }
	return { states = {}, start = nil, accepts = {} }
end

function MathUtils.dfaAddState(dfa: { states: { [string]: { [string]: string } }, start: string?, accepts: { [string]: boolean } }, name: string, isAccept: boolean?)
	dfa.states[name] = {}
	if isAccept then
		dfa.accepts[name] = true
	end
end

function MathUtils.dfaSetTransition(dfa: { states: { [string]: { [string]: string } }, start: string?, accepts: { [string]: boolean } }, from: string, symbol: string, to: string)
	if not dfa.states[from] then
		dfa.states[from] = {}
	end
	dfa.states[from][symbol] = to
end

function MathUtils.dfaSimulate(dfa: { states: { [string]: { [string]: string } }, start: string?, accepts: { [string]: boolean } }, input: string): boolean
	if not dfa.start then
		return false
	end
	local current = dfa.start
	for i = 1, #input do
		local ch = string.sub(input, i, i)
		local nextState = dfa.states[current] and dfa.states[current][ch]
		if not nextState then
			return false
		end
		current = nextState
	end
	return dfa.accepts[current] == true
end

function MathUtils.createNFA(): { states: { [string]: { [string]: { string } } }, start: string?, accepts: { [string]: boolean } }
	return { states = {}, start = nil, accepts = {} }
end

function MathUtils.nfaAddState(nfa: { states: { [string]: { [string]: { string } } }, start: string?, accepts: { [string]: boolean } }, name: string, isAccept: boolean?)
	nfa.states[name] = {}
	if isAccept then
		nfa.accepts[name] = true
	end
end

function MathUtils.nfaAddTransition(nfa: { states: { [string]: { [string]: { string } } }, start: string?, accepts: { [string]: boolean } }, from: string, symbol: string, to: string)
	if not nfa.states[from] then
		nfa.states[from] = {}
	end
	if not nfa.states[from][symbol] then
		nfa.states[from][symbol] = {}
	end
	table.insert(nfa.states[from][symbol], to)
end

function MathUtils.nfaEpsilonClosure(nfa: { states: { [string]: { [string]: { string } } }, start: string?, accepts: { [string]: boolean } }, states: { string }): { string }
	local closure: { [string]: boolean } = {}
	local stack: { string } = {}
	for _, s in ipairs(states) do
		if not closure[s] then
			closure[s] = true
			table.insert(stack, s)
		end
	end
	while #stack > 0 do
		local s = table.remove(stack) :: string
		local stateTransitions = nfa.states[s]
		local epsilonTransitions = stateTransitions and stateTransitions[""]
		if epsilonTransitions then
			for _, t in ipairs(epsilonTransitions) do
				if not closure[t] then
					closure[t] = true
					table.insert(stack, t)
				end
			end
		end
	end
	local result: { string } = {}
	for s, _ in pairs(closure) do
		table.insert(result, s)
	end
	return result
end

function MathUtils.nfaSimulate(nfa: { states: { [string]: { [string]: { string } } }, start: string?, accepts: { [string]: boolean } }, input: string): boolean
	if not nfa.start then
		return false
	end
	local currentStates = MathUtils.nfaEpsilonClosure(nfa, { nfa.start })
	for i = 1, #input do
		local ch = string.sub(input, i, i)
		local nextStates: { string } = {}
		for _, s in ipairs(currentStates) do
			local transitions = nfa.states[s] and nfa.states[s][ch]
			if transitions then
				for _, t in ipairs(transitions) do
					table.insert(nextStates, t)
				end
			end
		end
		currentStates = MathUtils.nfaEpsilonClosure(nfa, nextStates)
		if #currentStates == 0 then
			return false
		end
	end
	for _, s in ipairs(currentStates) do
		if nfa.accepts[s :: string] then
			return true
		end
	end
	return false
end

function MathUtils.regexToNFA(pattern: string): { states: { [string]: { [string]: { string } } }, start: string?, accepts: { [string]: boolean } }
	local nfa = MathUtils.createNFA()
	local stateCounter = 0
	local function newState(): string
		stateCounter += 1
		return "s" .. stateCounter
	end
	local start = newState()
	MathUtils.nfaAddState(nfa, start, false)
	nfa.start = start
	local i = 1
	while i <= #pattern do
		local ch = string.sub(pattern, i, i)
		if ch == "(" then
		elseif ch == ")" then
		elseif ch == "*" then
		elseif ch == "+" then
		elseif ch == "?" then
		elseif ch == "." then
		elseif ch == "|" then
		else
			local s0 = newState()
			local s1 = newState()
			MathUtils.nfaAddState(nfa, s0, false)
			MathUtils.nfaAddState(nfa, s1, false)
			MathUtils.nfaAddTransition(nfa, start, "", s0)
			MathUtils.nfaAddTransition(nfa, s0, ch, s1)
			start = s1
		end
		i += 1
	end
	nfa.accepts[start] = true
	return nfa
end

function MathUtils.factorial(n: number): number
	if n < 0 then return 0 end
	local result = 1
	for i = 2, n do
		result *= i
	end
	return result
end

function MathUtils.binomialCoefficient(n: number, k: number): number
	if k < 0 or k > n then return 0 end
	if k == 0 or k == n then return 1 end
	k = math.min(k, n - k)
	local result = 1
	for i = 1, k do
		result = result * (n - k + i) / i
	end
	return math.floor(result + 0.5)
end

function MathUtils.permutations(n: number, k: number): number
	if k > n or k < 0 then return 0 end
	local result = 1
	for i = 0, k - 1 do
		result *= n - i
	end
	return result
end

function MathUtils.combinations(n: number, k: number): number
	return MathUtils.binomialCoefficient(n, k)
end

function MathUtils.gammaFunction(x: number): number
	if x <= 0 then return math.huge end
	local p = { 0.99999999999980993, 676.5203681218851, -1259.1392167224028, 771.32342877765313, -176.61502916214059, 12.507343278686905, -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7 }
	local result = p[1]
	for i = 2, #p do
		result += p[i] / (x + i - 2)
	end
	local t = x + #p - 1.5
	return math.sqrt(2 * math.pi) * t ^ (x - 0.5) * math.exp(-t) * result
end

function MathUtils.betaFunction(a: number, b: number): number
	return (MathUtils.gammaFunction(a) * MathUtils.gammaFunction(b)) / MathUtils.gammaFunction(a + b)
end

function MathUtils.erf(x: number): number
	local a1 = 0.254829592
	local a2 = -0.284496736
	local a3 = 1.421413741
	local a4 = -1.453152027
	local a5 = 1.061405429
	local p = 0.3275911
	local sign = if x < 0 then -1 else 1
	x = math.abs(x)
	local t = 1 / (1 + p * x)
	local y = 1 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * math.exp(-x * x)
	return sign * y
end

function MathUtils.normalPDF(x: number, mean: number, stdDev: number): number
	local exponent = -0.5 * ((x - mean) / stdDev) ^ 2
	return math.exp(exponent) / (stdDev * math.sqrt(2 * math.pi))
end

function MathUtils.normalCDF(x: number, mean: number, stdDev: number): number
	return 0.5 * (1 + MathUtils.erf((x - mean) / (stdDev * math.sqrt(2))))
end

function MathUtils.poissonPDF(k: number, lambda: number): number
	return (lambda ^ k * math.exp(-lambda)) / MathUtils.factorial(k)
end

function MathUtils.exponentialPDF(x: number, lambda: number): number
	if x < 0 then return 0 end
	return lambda * math.exp(-lambda * x)
end

function MathUtils.uniformPDF(x: number, a: number, b: number): number
	if x < a or x > b then return 0 end
	return 1 / (b - a)
end

function MathUtils.simpsonRule(f: (number) -> number, a: number, b: number, n: number?): number
	if a == b then return 0 end
	local segments = n or 100
	if segments % 2 == 1 then segments += 1 end
	local h = (b - a) / segments
	local sum = f(a) + f(b)
	for i = 1, segments - 1 do
		local x = a + i * h
		if i % 2 == 0 then
			sum += 2 * f(x)
		else
			sum += 4 * f(x)
		end
	end
	return sum * h / 3
end

function MathUtils.trapezoidalRule(f: (number) -> number, a: number, b: number, n: number?): number
	if a == b then return 0 end
	local segments = n or 100
	local h = (b - a) / segments
	local sum = 0.5 * (f(a) + f(b))
	for i = 1, segments - 1 do
		sum += f(a + i * h)
	end
	return sum * h
end

function MathUtils.bisectionMethod(f: (number) -> number, a: number, b: number, tol: number?, maxIter: number?): (number, boolean)
	local tolerance = tol or 1e-6
	local iter = maxIter or 100
	local fa, fb = f(a), f(b)
	if fa * fb > 0 then
		return (a + b) / 2, false
	end
	for _ = 1, iter do
		local mid = (a + b) / 2
		local fmid = f(mid)
		if math.abs(fmid) < tolerance or (b - a) / 2 < tolerance then
			return mid, true
		end
		if fa * fmid > 0 then
			a = mid
			fa = fmid
		else
			b = mid
			fb = fmid
		end
	end
	return (a + b) / 2, false
end

function MathUtils.goldenSectionSearch(f: (number) -> number, a: number, b: number, tol: number?): (number, number)
	local tolerance = tol or 1e-5
	local phi = (1 + math.sqrt(5)) / 2
	local resPhi = 2 - phi
	local c = a + resPhi * (b - a)
	local d = b - resPhi * (b - a)
	local fc, fd = f(c), f(d)
	while math.abs(b - a) > tolerance do
		if fc < fd then
			b = d
			d = c
			fd = fc
			c = a + resPhi * (b - a)
			fc = f(c)
		else
			a = c
			c = d
			fc = fd
			d = b - resPhi * (b - a)
			fd = f(d)
		end
	end
	return (b + a) / 2, f((b + a) / 2)
end

function MathUtils.gradientDescent1D(f: (number) -> number, df: (number) -> number, x0: number, lr: number?, maxIter: number?): (number, number)
	local learningRate = lr or 0.01
	local iter = maxIter or 1000
	local x = x0
	for _ = 1, iter do
		local grad = df(x)
		x -= learningRate * grad
	end
	return x, f(x)
end

function MathUtils.simulatedAnnealing(f: (number) -> number, initial: number, temp: number?, cooling: number?, maxIter: number?): (number, number)
	local T = temp or 100
	local alpha = cooling or 0.95
	local iter = maxIter or 1000
	local current = initial
	local currentEnergy = f(current)
	local best = current
	local bestEnergy = currentEnergy
	local rng = math.random
	for _ = 1, iter do
		local neighbor = current + (rng() - 0.5) * 2
		local energy = f(neighbor)
		local delta = energy - currentEnergy
		if delta < 0 or rng() < math.exp(-delta / T) then
			current = neighbor
			currentEnergy = energy
			if energy < bestEnergy then
				best = neighbor
				bestEnergy = energy
			end
		end
		T *= alpha
	end
	return best, bestEnergy
end

function MathUtils.fibonacci(n: number): number
	if n <= 1 then return n end
	local a, b = 0, 1
	for _ = 2, n do
		a, b = b, a + b
	end
	return b
end

function MathUtils.fibonacciSequence(count: number): { number }
	local seq: { number } = {}
	local a, b = 0, 1
	for _ = 1, count do
		table.insert(seq, a)
		a, b = b, a + b
	end
	return seq
end

function MathUtils.isPrime(n: number): boolean
	if n < 2 then return false end
	if n == 2 then return true end
	if n % 2 == 0 then return false end
	for i = 3, math.sqrt(n), 2 do
		if n % i == 0 then return false end
	end
	return true
end

function MathUtils.primeSieve(limit: number): { number }
	local isComposite: { boolean } = {}
	local primes: { number } = {}
	for i = 2, limit do
		if not isComposite[i] then
			table.insert(primes, i)
			for j = i * i, limit, i do
				isComposite[j] = true
			end
		end
	end
	return primes
end

function MathUtils.gcd(a: number, b: number): number
	while b ~= 0 do
		a, b = b, a % b
	end
	return math.abs(a)
end

function MathUtils.lcm(a: number, b: number): number
	return math.abs(a * b) / MathUtils.gcd(a, b)
end

function MathUtils.modularInverse(a: number, m: number): number?
	if MathUtils.gcd(a, m) ~= 1 then
		return nil
	end
	local m0 = m
	local x0, x1 = 0, 1
	if m == 1 then return 0 end
	while a > 1 do
		local q = math.floor(a / m)
		local t = m
		m = a % m
		a = t
		t = x0
		x0 = x1 - q * x0
		x1 = t
	end
	if x1 < 0 then x1 += m0 end
	return x1
end

function MathUtils.modularExponentiation(base: number, exp: number, mod: number): number
	local result = 1
	base = base % mod
	while exp > 0 do
		if exp % 2 == 1 then
			result = (result * base) % mod
		end
		exp = math.floor(exp / 2)
		base = (base * base) % mod
	end
	return result
end

function MathUtils.chineseRemainderTheorem(rem: { number }, mod: { number }): number
	local prod = 1
	for _, m in ipairs(mod) do
		prod *= m
	end
	local result = 0
	for i = 1, #rem do
		local p = prod / mod[i]
		local inv = MathUtils.modularInverse(p % mod[i], mod[i])
		if inv == nil then return 0 end
		result += rem[i] * p * inv
	end
	return result % prod
end

function MathUtils.sigmoidDerivative(x: number): number
	local s = MathUtils.sigmoid(x)
	return s * (1 - s)
end

function MathUtils.relu(x: number): number
	return math.max(0, x)
end

function MathUtils.reluDerivative(x: number): number
	return if x > 0 then 1 else 0
end

function MathUtils.tanh(x: number): number
	return math.tanh(x)
end

function MathUtils.softmax(values: { number }): { number }
	local maxVal = values[1]
	for _, v in ipairs(values) do
		if v > maxVal then maxVal = v end
	end
	local sum = 0
	local expVals: { number } = {}
	for _, v in ipairs(values) do
		local e = math.exp(v - maxVal)
		table.insert(expVals, e)
		sum += e
	end
	for i = 1, #expVals do
		expVals[i] /= sum
	end
	return expVals
end

function MathUtils.crossEntropyLoss(predicted: { number }, actual: { number }): number
	local loss = 0
	for i = 1, #predicted do
		local p = math.clamp(predicted[i], 1e-15, 1 - 1e-15)
		loss -= actual[i] * math.log(p)
	end
	return loss / #predicted
end

function MathUtils.meanSquaredError(predicted: { number }, actual: { number }): number
	local sum = 0
	for i = 1, #predicted do
		local diff = predicted[i] - actual[i]
		sum += diff * diff
	end
	return sum / #predicted
end

function MathUtils.dotProduct(a: { number }, b: { number }): number
	local sum = 0
	for i = 1, #a do
		sum += a[i] * b[i]
	end
	return sum
end

function MathUtils.vectorMagnitude(v: { number }): number
	local sum = 0
	for _, x in ipairs(v) do
		sum += x * x
	end
	return math.sqrt(sum)
end

function MathUtils.vectorNormalize(v: { number }): { number }
	local mag = MathUtils.vectorMagnitude(v)
	if mag < 1e-10 then
		return v
	end
	local result: { number } = {}
	for _, x in ipairs(v) do
		table.insert(result, x / mag)
	end
	return result
end

function MathUtils.vectorAdd(a: { number }, b: { number }): { number }
	local result: { number } = {}
	for i = 1, #a do
		result[i] = a[i] + b[i]
	end
	return result
end

function MathUtils.vectorSubtract(a: { number }, b: { number }): { number }
	local result: { number } = {}
	for i = 1, #a do
		result[i] = a[i] - b[i]
	end
	return result
end

function MathUtils.vectorScale(v: { number }, s: number): { number }
	local result: { number } = {}
	for _, x in ipairs(v) do
		table.insert(result, x * s)
	end
	return result
end

function MathUtils.matrixMultiply(a: { number }, b: { number }, aRows: number, aCols: number, bCols: number): { number }
	local result: { number } = {}
	for i = 1, aRows do
		for j = 1, bCols do
			local sum = 0
			for k = 1, aCols do
				sum += a[(i - 1) * aCols + k] * b[(k - 1) * bCols + j]
			end
			table.insert(result, sum)
		end
	end
	return result
end

function MathUtils.matrixAdd(a: { number }, b: { number }): { number }
	local result: { number } = {}
	for i = 1, #a do
		result[i] = a[i] + b[i]
	end
	return result
end

function MathUtils.matrixSubtract(a: { number }, b: { number }): { number }
	local result: { number } = {}
	for i = 1, #a do
		result[i] = a[i] - b[i]
	end
	return result
end

function MathUtils.matrixTranspose(m: { number }, rows: number, cols: number): { number }
	local result: { number } = {}
	for i = 1, cols do
		for j = 1, rows do
			table.insert(result, m[(j - 1) * cols + i])
		end
	end
	return result
end

function MathUtils.matrixIdentity(size: number): { number }
	local result: { number } = {}
	for i = 1, size do
		for j = 1, size do
			table.insert(result, if i == j then 1 else 0)
		end
	end
	return result
end

function MathUtils.matrixTrace(m: { number }, size: number): number
	local trace = 0
	for i = 1, size do
		trace += m[(i - 1) * size + i]
	end
	return trace
end

function MathUtils.matrixFrobeniusNorm(m: { number }): number
	local sum = 0
	for _, v in ipairs(m) do
		sum += v * v
	end
	return math.sqrt(sum)
end

function MathUtils.covarianceMatrix(data: { { number } }): { { number } }
	local n = #data
	if n == 0 then return {} end
	local dim = #data[1]
	local means: { number } = {}
	for j = 1, dim do
		local sum = 0
		for i = 1, n do
			sum += data[i][j]
		end
		means[j] = sum / n
	end
	local cov: { { number } } = {}
	for i = 1, dim do
		cov[i] = {}
		for j = 1, dim do
			local sum = 0
			for k = 1, n do
				sum += (data[k][i] - means[i]) * (data[k][j] - means[j])
			end
			cov[i][j] = sum / (n - 1)
		end
	end
	return cov
end

function MathUtils.pca2D(data: { { number } }): ({ number }, { number })
	local cov = MathUtils.covarianceMatrix(data)
	if #cov < 2 then
		return {}, {}
	end
	local a, b, c = cov[1][1], cov[1][2], cov[2][2]
	local trace = a + c
	local det = a * c - b * b
	local lambda1 = trace / 2 + math.sqrt(trace * trace / 4 - det)
	local lambda2 = trace / 2 - math.sqrt(trace * trace / 4 - det)
	local eigenvector1: { number } = {}
	if math.abs(b) > 1e-10 then
		eigenvector1 = { lambda1 - c, b }
	else
		eigenvector1 = { 1, 0 }
	end
	local eigenvector2: { number } = {}
	if math.abs(b) > 1e-10 then
		eigenvector2 = { lambda2 - c, b }
	else
		eigenvector2 = { 0, 1 }
	end
	return MathUtils.vectorNormalize(eigenvector1), MathUtils.vectorNormalize(eigenvector2)
end

function MathUtils.kMeansClustering(data: { { number } }, k: number, maxIter: number?, seed: number?): { { { number } } }
	local iter = maxIter or 100
	local rng = MathUtils.seededRandom(seed or 12345)
	local dim = #data[1]
	local centroids: { { number } } = {}
	for i = 1, k do
		local idx = math.floor(rng() * #data) + 1
		local copy: { number } = {}
		for _, v in ipairs(data[idx]) do
			table.insert(copy, v)
		end
		table.insert(centroids, copy)
	end
	for _ = 1, iter do
		local clusters: { { { number } } } = {}
		for _ = 1, k do
			table.insert(clusters, {} :: { { number } })
		end
		for _, point in ipairs(data) do
			local bestIdx = 1
			local bestDist = math.huge
			for j = 1, k do
				local dist = 0
				for d = 1, dim do
					local diff = point[d] - centroids[j][d]
					dist += diff * diff
				end
				if dist < bestDist then
					bestDist = dist
					bestIdx = j
				end
			end
			table.insert(clusters[bestIdx], point)
		end
		for j = 1, k do
			if #clusters[j] > 0 then
				for d = 1, dim do
					local sum = 0
					for _, point in ipairs(clusters[j]) do
						sum += point[d]
					end
					centroids[j][d] = sum / #clusters[j]
				end
			end
		end
	end
	local finalClusters: { { { number } } } = {}
	for j = 1, k do
		table.insert(finalClusters, {} :: { { number } })
	end
	for _, point in ipairs(data) do
		local bestIdx = 1
		local bestDist = math.huge
		for j = 1, k do
			local dist = 0
			for d = 1, dim do
				local diff = point[d] - centroids[j][d]
				dist += diff * diff
			end
			if dist < bestDist then
				bestDist = dist
				bestIdx = j
			end
		end
		table.insert(finalClusters[bestIdx], point)
	end
	return finalClusters
end

function MathUtils.principalComponentProjection(data: { { number } }, components: { { number } }): { { number } }
	local projected: { { number } } = {}
	for _, point in ipairs(data) do
		local newPoint: { number } = {}
		for _, comp in ipairs(components) do
			table.insert(newPoint, MathUtils.dotProduct(point, comp))
		end
		table.insert(projected, newPoint)
	end
	return projected
end

function MathUtils.jaroSimilarity(a: string, b: string): number
	local m, n = #a, #b
	if m == 0 and n == 0 then return 1 end
	local matchDistance = math.floor(math.max(m, n) / 2) - 1
	local aMatches: { boolean } = {}
	local bMatches: { boolean } = {}
	local matches = 0
	local transpositions = 0
	for i = 1, m do
		local startIdx = math.max(1, i - matchDistance)
		local endIdx = math.min(n, i + matchDistance)
		for j = startIdx, endIdx do
			if bMatches[j] then
				continue
			end
			if string.byte(a, i) ~= string.byte(b, j) then
				continue
			end
			aMatches[i] = true
			bMatches[j] = true
			matches += 1
			break
		end
	end
	if matches == 0 then return 0 end
	local k = 1
	for i = 1, m do
		if not aMatches[i] then
			continue
		end
		while not bMatches[k] do
			k += 1
		end
		if string.byte(a, i) ~= string.byte(b, k) then
			transpositions += 1
		end
		k += 1
	end
	transpositions = math.floor(transpositions / 2)
	return ((matches / m) + (matches / n) + ((matches - transpositions) / matches)) / 3
end

function MathUtils.jaroWinklerDistance(a: string, b: string, p: number?): number
	local jaro = MathUtils.jaroSimilarity(a, b)
	local prefix = 0
	for i = 1, math.min(4, math.min(#a, #b)) do
		if string.byte(a, i) == string.byte(b, i) then
			prefix += 1
		else
			break
		end
	end
	local scaling = p or 0.1
	return jaro + prefix * scaling * (1 - jaro)
end

function MathUtils.rabinKarpSearch(text: string, pattern: string, base: number?): { number }
	if #pattern == 0 or #pattern > #text then
		return {}
	end
	local b = base or 256
	local m, n = #pattern, #text
	local h = 0
	for _ = 1, m - 1 do
		h = (h * b) % 2 ^ 32
	end
	local patternHash = 0
	local textHash = 0
	for i = 1, m do
		patternHash = (patternHash * b + string.byte(pattern, i)) % 2 ^ 32
		textHash = (textHash * b + string.byte(text, i)) % 2 ^ 32
	end
	local result: { number } = {}
	for i = 1, n - m + 1 do
		if patternHash == textHash then
			local match = true
			for j = 1, m do
				if string.byte(pattern, j) ~= string.byte(text, i + j - 1) then
					match = false
					break
				end
			end
			if match then
				table.insert(result, i)
			end
		end
		if i < n - m + 1 then
			textHash = ((textHash - string.byte(text, i) * h) * b + string.byte(text, i + m)) % 2 ^ 32
			if textHash < 0 then
				textHash += 2 ^ 32
			end
		end
	end
	return result
end

function MathUtils.matrixSolve3x3(m: { number }, b: { number }, out: { number }?): { number }?
	local det = m[1] * (m[5] * m[9] - m[6] * m[8])
		- m[2] * (m[4] * m[9] - m[6] * m[7])
		+ m[3] * (m[4] * m[8] - m[5] * m[7])
	if math.abs(det) < 1e-10 then return nil end
	local invDet = 1 / det
	local result = out or {}
	result[1] = (m[5] * m[9] - m[6] * m[8]) * invDet * b[1]
		+ (m[3] * m[8] - m[2] * m[9]) * invDet * b[2]
		+ (m[2] * m[6] - m[3] * m[5]) * invDet * b[3]
	result[2] = (m[6] * m[7] - m[4] * m[9]) * invDet * b[1]
		+ (m[1] * m[9] - m[3] * m[7]) * invDet * b[2]
		+ (m[3] * m[4] - m[1] * m[6]) * invDet * b[3]
	result[3] = (m[4] * m[8] - m[5] * m[7]) * invDet * b[1]
		+ (m[2] * m[7] - m[1] * m[8]) * invDet * b[2]
		+ (m[1] * m[5] - m[2] * m[4]) * invDet * b[3]
	for i = 4, #result do result[i] = nil end
	return result
end

function MathUtils.choleskyDecompose3x3(m: { number }): { number }?
	local l: { number } = { 0, 0, 0, 0, 0, 0, 0, 0, 0 }
	for i = 1, 3 do
		for j = 1, i do
			local sum = 0
			for k = 1, j - 1 do
				sum += l[(i - 1) * 3 + k] * l[(j - 1) * 3 + k]
			end
			if i == j then
				local val = m[(i - 1) * 3 + i] - sum
				if val <= 0 then return nil end
				l[(i - 1) * 3 + i] = math.sqrt(val)
			else
				local denom = l[(j - 1) * 3 + j]
				if math.abs(denom) < 1e-10 then return nil end
				l[(i - 1) * 3 + j] = (m[(i - 1) * 3 + j] - sum) / denom
			end
		end
	end
	return l
end

function MathUtils.luDecompose3x3(m: { number }): ({ number }?, { number }?, { number }?)
	local a = { table.unpack(m) }
	local n = 3
	local l: { number } = {}
	local u: { number } = {}
	local p: { number } = { 1, 2, 3 }
	for i = 1, n do
		for j = 1, n do
			l[(i - 1) * n + j] = if i == j then 1 else 0
			u[(i - 1) * n + j] = 0
		end
	end
	for k = 1, n do
		local maxRow = k
		local maxVal = math.abs(a[(k - 1) * n + k])
		for i = k + 1, n do
			local val = math.abs(a[(i - 1) * n + k])
			if val > maxVal then
				maxVal = val
				maxRow = i
			end
		end
		if maxVal < 1e-10 then return nil, nil, nil end
		if maxRow ~= k then
			for j = 1, n do
				a[(k - 1) * n + j], a[(maxRow - 1) * n + j] = a[(maxRow - 1) * n + j], a[(k - 1) * n + j]
			end
			p[k], p[maxRow] = p[maxRow], p[k]
			for j = 1, k - 1 do
				l[(k - 1) * n + j], l[(maxRow - 1) * n + j] = l[(maxRow - 1) * n + j], l[(k - 1) * n + j]
			end
		end
		for i = k, n do
			u[(k - 1) * n + i] = a[(k - 1) * n + i]
			for j = 1, k - 1 do
				u[(k - 1) * n + i] -= l[(k - 1) * n + j] * u[(j - 1) * n + i]
			end
		end
		for i = k + 1, n do
			l[(i - 1) * n + k] = a[(i - 1) * n + k]
			for j = 1, k - 1 do
				l[(i - 1) * n + k] -= l[(i - 1) * n + j] * u[(j - 1) * n + k]
			end
			local denom = u[(k - 1) * n + k]
			if math.abs(denom) < 1e-10 then return nil, nil, nil end
			l[(i - 1) * n + k] /= denom
		end
	end
	return l, u, p
end

function MathUtils.solveLinearSystem3x3(m: { number }, b: { number }): { number }?
	local l, u, p = MathUtils.luDecompose3x3(m)
	if not l or not u or not p then return nil end
	local n = 3
	local y: { number } = {}
	for i = 1, n do
		y[i] = b[(p[i] :: number)]
		for j = 1, i - 1 do
			y[i] -= l[(i - 1) * n + j] * y[j]
		end
	end
	local x: { number } = {}
	for i = n, 1, -1 do
		x[i] = y[i]
		for j = i + 1, n do
			x[i] -= u[(i - 1) * n + j] * x[j]
		end
		local denom = u[(i - 1) * n + i]
		if math.abs(denom) < 1e-10 then return nil end
		x[i] /= denom
	end
	return x
end

function MathUtils.quaternionToMatrix(qx: number, qy: number, qz: number, qw: number): { number }
	local x2, y2, z2 = qx * 2, qy * 2, qz * 2
	local xx, yy, zz = qx * x2, qy * y2, qz * z2
	local xy, xz, xw = qx * y2, qx * z2, qw * x2
	local yz, yw, zw = qy * z2, qw * y2, qw * z2
	return {
		1 - yy - zz, xy + zw, xz - yw,
		xy - zw, 1 - xx - zz, yz + xw,
		xz + yw, yz - xw, 1 - xx - yy
	}
end

function MathUtils.matrixMultiply3x3(a: { number }, b: { number }): { number }
	local result: { number } = {}
	for i = 1, 3 do
		for j = 1, 3 do
			local sum = 0
			for k = 1, 3 do
				sum += a[(i - 1) * 3 + k] * b[(k - 1) * 3 + j]
			end
			table.insert(result, sum)
		end
	end
	return result
end

function MathUtils.matrixTranspose3x3(m: { number }): { number }
	return {
		m[1], m[4], m[7],
		m[2], m[5], m[8],
		m[3], m[6], m[9]
	}
end

function MathUtils.matrixDeterminant3x3(m: { number }): number
	return m[1] * (m[5] * m[9] - m[6] * m[8])
		- m[2] * (m[4] * m[9] - m[6] * m[7])
		+ m[3] * (m[4] * m[8] - m[5] * m[7])
end

function MathUtils.matrixInverse3x3(m: { number }): { number }?
	local det = MathUtils.matrixDeterminant3x3(m)
	if math.abs(det) < 1e-10 then return nil end
	local invDet = 1 / det
	return {
		(m[5] * m[9] - m[6] * m[8]) * invDet,
		-(m[2] * m[9] - m[3] * m[8]) * invDet,
		(m[2] * m[6] - m[3] * m[5]) * invDet,
		-(m[4] * m[9] - m[6] * m[7]) * invDet,
		(m[1] * m[9] - m[3] * m[7]) * invDet,
		-(m[1] * m[6] - m[3] * m[4]) * invDet,
		(m[4] * m[8] - m[5] * m[7]) * invDet,
		-(m[1] * m[8] - m[2] * m[7]) * invDet,
		(m[1] * m[5] - m[2] * m[4]) * invDet
	}
end

function MathUtils.controlFlowGraphMetrics(edges: { { string } }): { [string]: number }
	local inDegree: { [string]: number } = {}
	local outDegree: { [string]: number } = {}
	local nodes: { [string]: boolean } = {}
	for _, e in ipairs(edges) do
		local u, v = e[1], e[2]
		nodes[u] = true
		nodes[v] = true
		outDegree[u] = (outDegree[u] or 0) + 1
		inDegree[v] = (inDegree[v] or 0) + 1
	end
	local cyclomatic = 0
	local edgeCount = #edges
	local nodeCount = 0
	for _ in pairs(nodes) do nodeCount += 1 end
	local connectedComponents = 0
	local visited: { [string]: boolean } = {}
	local adj: { [string]: { string } } = {}
	for _, e in ipairs(edges) do
		local u = e[1]
		local v = e[2]
		if not adj[u] then adj[u] = {} end
		table.insert(adj[u], v)
	end
	for node in pairs(nodes) do
		if not visited[node] then
			connectedComponents += 1
			local stack = { node }
			visited[node] = true
			while #stack > 0 do
				local u = table.remove(stack) :: string
				for _, v in ipairs(adj[u] or {}) do
					if not visited[v] then
						visited[v] = true
						table.insert(stack, v)
					end
				end
			end
		end
	end
	cyclomatic = edgeCount - nodeCount + 2 * connectedComponents
	return {
		edges = edgeCount,
		nodes = nodeCount,
		components = connectedComponents,
		cyclomatic = cyclomatic
	}
end

function MathUtils.scopeNestingDepth(scopes: { { parent: number? } }): { number }
	local depths: { number } = {}
	for i = 1, #scopes do
		local depth = 0
		local current = i
		while scopes[current] and scopes[current].parent do
			depth += 1
			current = scopes[current].parent :: number
		end
		depths[i] = depth
	end
	return depths
end

function MathUtils.symbolTableHashCount(symbols: { string }): { [string]: number }
	local counts: { [string]: number } = {}
	for _, symbol in ipairs(symbols) do
		local hash = MathUtils.fnv1aHash32(symbol)
		local key = tostring(hash)
		counts[key] = (counts[key] or 0) + 1
	end
	return counts
end

function MathUtils.astNodeCount(children: { { number } }): number
	local count = 0
	local visited: { [number]: boolean } = {}
	local stack: { number } = {}
	for i = 1, #children do
		if not visited[i] then
			table.insert(stack, i)
			visited[i] = true
		end
	end
	while #stack > 0 do
		local node = table.remove(stack) :: number
		count += 1
		for _, child in ipairs(children[node] or {}) do
			if not visited[child] then
				visited[child] = true
				table.insert(stack, child)
			end
		end
	end
	return count
end

function MathUtils.tokenFrequency(tokens: { string }): { [string]: number }
	local freq: { [string]: number } = {}
	for _, token in ipairs(tokens) do
		freq[token] = (freq[token] or 0) + 1
	end
	return freq
end

function MathUtils.sourceCodeEntropy(tokens: { string }): number
	local freq = MathUtils.tokenFrequency(tokens)
	local total = #tokens
	local entropy = 0
	for _, count in pairs(freq) do
		local p = count / total
		entropy -= p * math.log(p, 2)
	end
	return entropy
end

function MathUtils.basicBlockCoverage(blocks: { number }, executed: { number }): number
	local execSet: { [number]: boolean } = {}
	for _, b in ipairs(executed) do
		execSet[b] = true
	end
	local count = 0
	for _, b in ipairs(blocks) do
		if execSet[b] then
			count += 1
		end
	end
	return count / #blocks
end

function MathUtils.instructionPerBasicBlock(blockSizes: { number }): number
	local sum = 0
	for _, size in ipairs(blockSizes) do
		sum += size
	end
	return sum / #blockSizes
end

function MathUtils.liveVariableAnalysis(variables: { string }, uses: { { [string]: boolean } }, defs: { { [string]: boolean } }): { { string } }
	local liveIn: { { [string]: boolean } } = {}
	local liveOut: { { [string]: boolean } } = {}
	local n = #uses
	for i = 1, n do
		liveIn[i] = {}
		liveOut[i] = {}
	end
	local changed = true
	while changed do
		changed = false
		for i = 1, n do
			local newOut: { [string]: boolean } = {}
			for _, var in ipairs(variables) do
				if liveIn[i][var] and not defs[i][var] then
					newOut[var] = true
				end
			end
			for var in pairs(newOut) do
				if not liveOut[i][var] then
					liveOut[i][var] = true
					changed = true
				end
			end
			for var in pairs(liveOut[i]) do
				if not liveIn[i][var] then
					liveIn[i][var] = true
					changed = true
				end
			end
		end
	end
	local result: { { string } } = {}
	for i = 1, n do
		result[i] = {}
		for var in pairs(liveIn[i]) do
			table.insert(result[i], var)
		end
	end
	return result
end

function MathUtils.dominatorTree(startNode: string, edges: { { string } }): { [string]: string? }
	local nodes: { [string]: boolean } = {}
	local pred: { [string]: { string } } = {}
	local succ: { [string]: { string } } = {}
	for _, e in ipairs(edges) do
		local u, v = e[1], e[2]
		nodes[u] = true
		nodes[v] = true
		if not succ[u] then succ[u] = {} end
		if not pred[v] then pred[v] = {} end
		table.insert(succ[u], v)
		table.insert(pred[v], u)
	end
	local dom: { [string]: { [string]: boolean } } = {}
	local allNodes: { string } = {}
	for node in pairs(nodes) do
		table.insert(allNodes, node)
		dom[node] = {}
		for other in pairs(nodes) do
			dom[node][other] = true
		end
	end
	if dom[startNode] then
		for node in pairs(nodes) do
			dom[startNode][node] = (node == startNode)
		end
	end
	local changed = true
	while changed do
		changed = false
		for _, node in ipairs(allNodes) do
			if node ~= startNode then
				local newDom: { [string]: boolean } = {}
				for other in pairs(nodes) do
					newDom[other] = true
				end
				for _, p in ipairs(pred[node] or {}) do
					for other in pairs(nodes) do
						if not dom[p][other] then
							newDom[other] = false
						end
					end
				end
				newDom[node] = true
				for other in pairs(nodes) do
					if dom[node][other] ~= newDom[other] then
						dom[node][other] = newDom[other]
						changed = true
					end
				end
			end
		end
	end
	local idom: { [string]: string? } = {}
	for _, node in ipairs(allNodes) do
		if node ~= startNode then
			for candidate in pairs(nodes) do
				if dom[node][candidate] and candidate ~= node then
					local isIdom = true
					for other in pairs(nodes) do
						if dom[node][other] and other ~= node and other ~= candidate and dom[candidate][other] then
							isIdom = false
							break
						end
					end
					if isIdom then
						idom[node] = candidate
						break
					end
				end
			end
		end
	end
	return idom
end

function MathUtils.polygonCentroid2D(polygon: { Vector2 }): Vector2
	local n = #polygon
	if n == 0 then return Vector2.zero end
	local cx, cy = 0, 0
	local area = 0
	for i = 1, n do
		local j = i % n + 1
		local cross = polygon[i].X * polygon[j].Y - polygon[j].X * polygon[i].Y
		area += cross
		cx += (polygon[i].X + polygon[j].X) * cross
		cy += (polygon[i].Y + polygon[j].Y) * cross
	end
	area *= 0.5
	if math.abs(area) < 1e-10 then
		return Vector2.zero
	end
	return Vector2.new(cx / (6 * area), cy / (6 * area))
end

function MathUtils.polygonPerimeter2D(polygon: { Vector2 }): number
	local n = #polygon
	if n == 0 then return 0 end
	local perim = 0
	for i = 1, n do
		local j = i % n + 1
		local dx = polygon[j].X - polygon[i].X
		local dy = polygon[j].Y - polygon[i].Y
		perim += math.sqrt(dx * dx + dy * dy)
	end
	return perim
end

function MathUtils.circleBoundingBox(center: Vector2, radius: number): { minX: number, minY: number, maxX: number, maxY: number }
	return {
		minX = center.X - radius,
		minY = center.Y - radius,
		maxX = center.X + radius,
		maxY = center.Y + radius
	}
end

function MathUtils.intersectRayAABB2D(origin: Vector2, dir: Vector2, minX: number, minY: number, maxX: number, maxY: number): (boolean, number?, number?)
	local invDirX = 1 / dir.X
	local invDirY = 1 / dir.Y
	local tMinX = (minX - origin.X) * invDirX
	local tMaxX = (maxX - origin.X) * invDirX
	local tMinY = (minY - origin.Y) * invDirY
	local tMaxY = (maxY - origin.Y) * invDirY
	local t1x = math.min(tMinX, tMaxX)
	local t2x = math.max(tMinX, tMaxX)
	local t1y = math.min(tMinY, tMaxY)
	local t2y = math.max(tMinY, tMaxY)
	local tNear = math.max(t1x, t1y)
	local tFar = math.min(t2x, t2y)
	if tNear > tFar or tFar < 0 then
		return false, nil, nil
	end
	return true, tNear, tFar
end

function MathUtils.distPointToSegment2D(p: Vector2, a: Vector2, b: Vector2): number
	local abX = b.X - a.X
	local abY = b.Y - a.Y
	local apX = p.X - a.X
	local apY = p.Y - a.Y
	local abLenSq = abX * abX + abY * abY
	if abLenSq < 1e-10 then
		return math.sqrt(apX * apX + apY * apY)
	end
	local t = math.clamp((apX * abX + apY * abY) / abLenSq, 0, 1)
	local closestX = a.X + t * abX
	local closestY = a.Y + t * abY
	local dx = p.X - closestX
	local dy = p.Y - closestY
	return math.sqrt(dx * dx + dy * dy)
end

function MathUtils.distPointToLine2D(p: Vector2, a: Vector2, b: Vector2): number
	local abX = b.X - a.X
	local abY = b.Y - a.Y
	local apX = p.X - a.X
	local apY = p.Y - a.Y
	local abLenSq = abX * abX + abY * abY
	if abLenSq < 1e-10 then
		return math.sqrt(apX * apX + apY * apY)
	end
	local t = (apX * abX + apY * abY) / abLenSq
	local closestX = a.X + t * abX
	local closestY = a.Y + t * abY
	local dx = p.X - closestX
	local dy = p.Y - closestY
	return math.sqrt(dx * dx + dy * dy)
end

function MathUtils.reflectPointAcrossLine2D(p: Vector2, a: Vector2, b: Vector2): Vector2
	local abX = b.X - a.X
	local abY = b.Y - a.Y
	local apX = p.X - a.X
	local apY = p.Y - a.Y
	local abLenSq = abX * abX + abY * abY
	if abLenSq < 1e-10 then
		return p
	end
	local t = (apX * abX + apY * abY) / abLenSq
	local closestX = a.X + t * abX
	local closestY = a.Y + t * abY
	return Vector2.new(2 * closestX - p.X, 2 * closestY - p.Y)
end

function MathUtils.rotatePoint2D(p: Vector2, angle: number): Vector2
	local c = math.cos(angle)
	local s = math.sin(angle)
	return Vector2.new(p.X * c - p.Y * s, p.X * s + p.Y * c)
end

function MathUtils.scalePoint2D(p: Vector2, sx: number, sy: number): Vector2
	return Vector2.new(p.X * sx, p.Y * sy)
end

function MathUtils.translatePoint2D(p: Vector2, tx: number, ty: number): Vector2
	return Vector2.new(p.X + tx, p.Y + ty)
end

function MathUtils.barycentricCoordinates2D(p: Vector2, a: Vector2, b: Vector2, c: Vector2): (number, number, number)
	local v0X = c.X - a.X
	local v0Y = c.Y - a.Y
	local v1X = b.X - a.X
	local v1Y = b.Y - a.Y
	local v2X = p.X - a.X
	local v2Y = p.Y - a.Y
	local d00 = v0X * v0X + v0Y * v0Y
	local d01 = v0X * v1X + v0Y * v1Y
	local d11 = v1X * v1X + v1Y * v1Y
	local d20 = v2X * v0X + v2Y * v0Y
	local d21 = v2X * v1X + v2Y * v1Y
	local denom = d00 * d11 - d01 * d01
	if math.abs(denom) < 1e-10 then
		return 0, 0, 0
	end
	local v = (d11 * d20 - d01 * d21) / denom
	local w = (d00 * d21 - d01 * d20) / denom
	local u = 1 - v - w
	return u, v, w
end

function MathUtils.isPointInTriangle2D(p: Vector2, a: Vector2, b: Vector2, c: Vector2): boolean
	local u, v, w = MathUtils.barycentricCoordinates2D(p, a, b, c)
	return u >= 0 and v >= 0 and w >= 0
end

function MathUtils.triangleArea2D(a: Vector2, b: Vector2, c: Vector2): number
	return math.abs((b.X - a.X) * (c.Y - a.Y) - (c.X - a.X) * (b.Y - a.Y)) * 0.5
end

function MathUtils.minEnclosingCircle2D(points: { Vector2 }): (Vector2, number)
	if #points == 0 then
		return Vector2.zero, 0
	end
	local center = points[1]
	local radius = 0
	for i = 2, #points do
		local p = points[i]
		local dx = p.X - center.X
		local dy = p.Y - center.Y
		local dist = math.sqrt(dx * dx + dy * dy)
		if dist > radius then
			local newRadius = (radius + dist) * 0.5
			local ratio = newRadius / dist
			center = Vector2.new(center.X + (p.X - center.X) * ratio, center.Y + (p.Y - center.Y) * ratio)
			radius = newRadius
		end
	end
	return center, radius
end

function MathUtils.lissajousCurve(t: number, a: number, b: number, delta: number): (number, number)
	return math.sin(a * t + delta), math.sin(b * t)
end

function MathUtils.spiralPoint(t: number, a: number, b: number): (number, number)
	local r = a + b * t
	return r * math.cos(t), r * math.sin(t)
end

function MathUtils.heartCurve(t: number): (number, number)
	local x = 16 * math.sin(t) ^ 3
	local y = 13 * math.cos(t) - 5 * math.cos(2 * t) - 2 * math.cos(3 * t) - math.cos(4 * t)
	return x, y
end

function MathUtils.superellipsePoint(t: number, a: number, b: number, n: number): (number, number)
	local absCos = math.abs(math.cos(t))
	local absSin = math.abs(math.sin(t))
	local x = a * (absCos ^ (2 / n)) * (if math.cos(t) < 0 then -1 else 1)
	local y = b * (absSin ^ (2 / n)) * (if math.sin(t) < 0 then -1 else 1)
	return x, y
end

function MathUtils.pascalTriangleRow(row: number): { number }
	local result: { number } = { 1 }
	for i = 1, row do
		result[i + 1] = result[i] * (row - i + 1) / i
	end
	return result
end

function MathUtils.hermiteInterpolation(t: number, p0: number, p1: number, m0: number, m1: number): number
	local t2 = t * t
	local t3 = t2 * t
	local h00 = 2 * t3 - 3 * t2 + 1
	local h10 = t3 - 2 * t2 + t
	local h01 = -2 * t3 + 3 * t2
	local h11 = t3 - t2
	return h00 * p0 + h10 * m0 + h01 * p1 + h11 * m1
end

function MathUtils.lagrangeInterpolation(points: { { x: number, y: number } }, x: number): number?
	local n = #points
	local result = 0
	for i = 1, n do
		local term = points[i].y
		for j = 1, n do
			if i ~= j then
				local denom = points[i].x - points[j].x
				if math.abs(denom) < EPSILON then
					return nil
				end
				term *= (x - points[j].x) / denom
			end
		end
		result += term
	end
	return result
end

function MathUtils.newtonDividedDifference(points: { { x: number, y: number } }, x: number): number?
	local n = #points
	for i = 1, n - 1 do
		for j = i + 1, n do
			if math.abs(points[i].x - points[j].x) < EPSILON then
				return nil
			end
		end
	end
	local divided: { { number } } = {}
	for i = 1, n do
		divided[i] = { points[i].y }
	end
	for j = 2, n do
		for i = 1, n - j + 1 do
			local dx = points[i + j - 1].x - points[i].x
			divided[i][j] = (divided[i + 1][j - 1] - divided[i][j - 1]) / dx
		end
	end
	local result = divided[1][1]
	local product = 1
	for i = 2, n do
		product *= (x - points[i - 1].x)
		result += divided[1][i] * product
	end
	return result
end

function MathUtils.riemannZetaApprox(s: number, terms: number?): number
	local n = terms or 1000
	local sum = 0
	for k = 1, n do
		sum += 1 / (k ^ s)
	end
	return sum
end

function MathUtils.harmonicNumber(n: number): number
	local sum = 0
	for k = 1, n do
		sum += 1 / k
	end
	return sum
end

function MathUtils.stirlingApproximation(n: number): number
	return math.sqrt(2 * math.pi * n) * (n / math.e) ^ n
end

function MathUtils.logFactorial(n: number): number
	if n < 0 then return -math.huge end
	local sum = 0
	for i = 2, n do
		sum += math.log(i)
	end
	return sum
end

return MathUtils
